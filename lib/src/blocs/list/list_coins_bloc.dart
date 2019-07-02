import 'package:criptocon/src/bloc_helpers/event/bloc_event_state.dart';
import 'package:criptocon/src/resource/repository.dart';
import 'list_coins_event.dart';
import 'list_coins_state.dart';

class ListCoinsBloc extends BlocEventStateBase<ListCoinsEvent, ListCoinsState> {
  ListCoinsBloc() : super(initialState: ListCoinsState.notInitialized());

  @override
  Stream<ListCoinsState> eventHandler(
      ListCoinsEvent event, ListCoinsState currentState) async* {
    if (!currentState.isInitialized) {
      yield ListCoinsState.notInitialized();
    }

    if (event.type == ApplicationInitializationEventType.start) {
      yield ListCoinsState.progressing(await Repository().fetchAllCoins());
    }

    if (event.type == ApplicationInitializationEventType.initialized) {
      yield ListCoinsState.initialized();
    }
  }
}
