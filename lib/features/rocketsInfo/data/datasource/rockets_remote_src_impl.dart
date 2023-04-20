import 'package:rockets_spacex/core/retrofit/rest_client.dart';
import 'package:rockets_spacex/features/rocketsInfo/data/datasource/rockets_remote_src.dart';
import 'package:rockets_spacex/features/rocketsInfo/data/model/rocket_response_item_model.dart';
import 'package:rockets_spacex/core/retrofit/retro_base.dart';

class RocketsRemoteSrcImpl implements RocketsRemoteSrc {
  @override
  Stream<List<RocketItemModel>> getRocketsInfo() {
    return Stream.fromFuture(
        RestClient(RetroBase().dioData()).getRocketsInfo().then((value) {
      return value;
    }));
  }

  @override
  Stream<RocketItemModel> getRocketDetails(String rocketId) {
    return Stream.fromFuture(RestClient(RetroBase().dioData())
        .getRocketDetails(rocketId)
        .then((value) {
      return value;
    }));
  }
}
