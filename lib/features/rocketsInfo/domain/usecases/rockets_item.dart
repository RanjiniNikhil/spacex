import 'package:dartz/dartz.dart';
import 'package:rockets_spacex/core/failure/failures.dart';
import 'package:rockets_spacex/core/usecase/usecases.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/entities/rockets_response_items.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/repository/rockets_repository.dart';

class RocketsItem extends UseCase<List<Rocket>, NoParams> {
  final RocketsRepository rocketsRepository;

  RocketsItem(this.rocketsRepository);

  @override
  Stream<Either<Failure, List<Rocket>>> call(NoParams params) {
    return rocketsRepository.getRocketsInfo();
  }
}
