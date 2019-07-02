import 'package:criptocon/src/bloc_helpers/event/bloc_event_state.dart';

class ApplicationInitializationEvent extends BlocEvent {
  final ApplicationInitializationEventType type;

  ApplicationInitializationEvent(
      {this.type: ApplicationInitializationEventType.start})
      : assert(type != null);
}

enum ApplicationInitializationEventType {
  start,
  initialized,
}
