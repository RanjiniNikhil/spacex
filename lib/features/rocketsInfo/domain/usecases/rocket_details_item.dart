import 'package:dartz/dartz.dart';
import 'package:rockets_spacex/core/failure/failures.dart';
import 'package:rockets_spacex/core/usecase/usecases.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/entities/rockets_response_items.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/repository/rockets_repository.dart';

class RocketDetailsItem extends UseCase<Rocket, String> {
  final RocketsRepository rocketsRepository;

  RocketDetailsItem(this.rocketsRepository);

  @override
  Stream<Either<Failure, Rocket>> call(String param) {
    return rocketsRepository.getRocketDetails(param);
  }
}
