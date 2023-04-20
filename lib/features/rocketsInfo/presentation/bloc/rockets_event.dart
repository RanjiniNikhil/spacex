import 'package:rockets_spacex/bloc/base_event.dart';

class RocketsEvent extends BaseEvent {}

class RocketsEventOnSuccess<T> extends BaseEvent {
  T response;

  RocketsEventOnSuccess(this.response);
}

class RocketDetailsEvent extends BaseEvent {
  String id;

  RocketDetailsEvent(this.id);
}

class RocketDetailsEventOnSuccess<T> extends BaseEvent {
  T response;

  RocketDetailsEventOnSuccess(this.response);
}
