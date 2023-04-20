import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:rockets_spacex/features/rocketsInfo/data/model/rocket_response_item_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://api.spacexdata.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/v4/rockets')
  Future<List<RocketItemModel>> getRocketsInfo();

  @GET('/v4/rockets/{rocket-id}')
  Future<RocketItemModel> getRocketDetails(@Path("rocket-id") String rocketId);
}
