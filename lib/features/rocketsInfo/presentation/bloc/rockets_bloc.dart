import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rockets_spacex/bloc/base_event.dart';
import 'package:rockets_spacex/bloc/base_state.dart';
import 'package:rockets_spacex/core/usecase/usecases.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/usecases/rocket_details_item.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/usecases/rockets_item.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_event.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_state.dart';

class RocketsBloc extends Bloc<BaseEvent, BaseState> {
  RocketsItem rocketsItem;
  RocketDetailsItem rocketDetailsItem;

  RocketsBloc(this.rocketsItem, this.rocketDetailsItem) : super(StateLoading());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is RocketsEvent) {
      yield StateLoading();
      fetchRocketsInfo();
    } else if (event is EventErrorGeneral) {
      yield StateErrorGeneral(event.errorMessage);
    } else if (event is RocketsEventOnSuccess) {
      yield RocketsStateOnSuccess(event.response);
    } else if (event is RocketDetailsEvent) {
      yield StateLoading();
      fetchRocketDetails(event.id);
    } else if (event is RocketDetailsEventOnSuccess) {
      yield RocketDetailsStateOnSuccess(event.response);
    }
  }

  fetchRocketsInfo() {
    rocketsItem.call(NoParams()).listen((event) {
      event.fold((onError) {
        add(EventErrorGeneral(onError.toString()));
      }, (response) {
        add(RocketsEventOnSuccess(response));
      });
    });
  }

  fetchRocketDetails(String id) {
    rocketDetailsItem.call(id).listen((event) {
      event.fold((onError) {
        add(EventErrorGeneral(onError.toString()));
      }, (response) {
        add(RocketDetailsEventOnSuccess(response));
      });
    });
  }
}
