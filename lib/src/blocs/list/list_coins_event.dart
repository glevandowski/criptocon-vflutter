import 'package:criptocon/src/bloc_helpers/event/bloc_event_state.dart';

class ListCoinsEvent extends BlocEvent {
  final ApplicationInitializationEventType type;

  ListCoinsEvent({
    this.type: ApplicationInitializationEventType.start,
  }) : assert(type != null);
}

enum ApplicationInitializationEventType {
  start,
  initialized,
}
