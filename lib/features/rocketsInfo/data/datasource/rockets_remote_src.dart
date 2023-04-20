import 'package:rockets_spacex/features/rocketsInfo/data/model/rocket_response_item_model.dart';

abstract class RocketsRemoteSrc {
  Stream<List<RocketItemModel>> getRocketsInfo();

  Stream<RocketItemModel> getRocketDetails(String rocketId);
}
