import 'package:rockets_spacex/bloc/base_state.dart';

class RocketsStateOnSuccess<T> extends BaseState {
  T response;

  RocketsStateOnSuccess(this.response);
}

class RocketDetailsStateOnSuccess<T> extends BaseState {
  T response;

  RocketDetailsStateOnSuccess(this.response);
}
