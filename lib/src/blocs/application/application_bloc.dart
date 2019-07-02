import 'package:criptocon/src/bloc_helpers/event/bloc_event_state.dart';
import 'application_event.dart';
import 'application_state.dart';

class ApplicationBloc extends BlocEventStateBase<ApplicationInitializationEvent,
    ApplicationInitializationState> {
  ApplicationBloc()
      : super(
          initialState: ApplicationInitializationState.notInitialized(),
        );

  @override
  Stream<ApplicationInitializationState> eventHandler(
      ApplicationInitializationEvent event,
      ApplicationInitializationState currentState) async* {
    if (!currentState.isInitialized) {
      yield ApplicationInitializationState.notInitialized();
    }

    if (event.type == ApplicationInitializationEventType.start) {
      for (int progress = 0; progress < 101; progress += 10) {
        await Future.delayed(const Duration(milliseconds: 300));
        yield ApplicationInitializationState.progressing(progress);
      }
    }

    if (event.type == ApplicationInitializationEventType.initialized) {
      yield ApplicationInitializationState.initialized();
    }
  }
}
