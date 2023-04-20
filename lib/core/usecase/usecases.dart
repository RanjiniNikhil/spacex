import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rockets_spacex/core/failure/failures.dart';

abstract class UseCase<Type, T> {
  Stream<Either<Failure, Type>> call(T params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}