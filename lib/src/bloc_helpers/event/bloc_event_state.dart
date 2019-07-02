import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:criptocon/src/bloc_helpers/provider/bloc_provider.dart';

abstract class BlocEvent extends Object {}

abstract class BlocState extends Object {}

abstract class BlocEventStateBase<BlocEvent, BlocState> implements BlocBase {
  PublishSubject<BlocEvent> eventController = PublishSubject<BlocEvent>();
  BehaviorSubject<BlocState> stateController = BehaviorSubject<BlocState>();

  Function(BlocEvent) get emitEvent => eventController.sink.add;

  Stream<BlocState> get state => stateController.stream;

  BlocState get lastState => stateController.value;

  Stream<BlocState> eventHandler(BlocEvent event, BlocState currentState);

  final BlocState initialState;

  BlocEventStateBase({
    @required this.initialState,
  }) {
    eventController.listen((BlocEvent event) {
      BlocState currentState = lastState ?? initialState;
      eventHandler(event, currentState).forEach((BlocState newState) {
        stateController.sink.add(newState);
      });
    });
  }

  @override
  void dispose() {
    eventController.close();
    stateController.close();
  }
}
