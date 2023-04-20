import 'package:dartz/dartz.dart';
import 'package:rockets_spacex/core/failure/failures.dart';
import 'package:rockets_spacex/features/rocketsInfo/data/datasource/rockets_remote_src.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/entities/rockets_response_items.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/repository/rockets_repository.dart';
import 'package:rockets_spacex/stringConstant.dart';

class RocketsRepositoryImpl implements RocketsRepository {
  RocketsRemoteSrc rocketsRemoteSrc;

  RocketsRepositoryImpl(this.rocketsRemoteSrc);

  @override
  Stream<Either<Failure, List<Rocket>>> getRocketsInfo() async* {
    try {
      var result = await rocketsRemoteSrc.getRocketsInfo().single;
      yield Right(result);
    } catch (e, s) {
      Failure error = await checkErrorState(e, s);
      print("Final error is ${e.toString()} ${s.toString()}");
      yield Left(error);
    }
  }

  Future<Failure> checkErrorState(e, StackTrace s) async {
    print(e);
    return FailureMessage(StringConstant.kSomethingWentWrong);
  }

  @override
  Stream<Either<Failure, Rocket>> getRocketDetails(String rocketId) async* {
    try {
      var result = await rocketsRemoteSrc.getRocketDetails(rocketId).single;
      yield Right(result);
    } catch (e, s) {
      Failure error = await checkErrorState(e, s);
      print("Final error is ${e.toString()} ${s.toString()}");
      yield Left(error);
    }
  }
}
