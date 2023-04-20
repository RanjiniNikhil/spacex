import 'package:dartz/dartz.dart';
import 'package:rockets_spacex/core/failure/failures.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/entities/rockets_response_items.dart';

abstract class RocketsRepository {
  Stream<Either<Failure, List<Rocket>>> getRocketsInfo();

  Stream<Either<Failure, Rocket>> getRocketDetails(String rocketId);
}
