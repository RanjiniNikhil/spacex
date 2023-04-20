import 'package:get_it/get_it.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/usecases/rocket_details_item.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_bloc.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/usecases/rockets_item.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/repository/rockets_repository.dart';
import 'package:rockets_spacex/features/rocketsInfo/data/repository/rockets_repository_impl.dart';
import 'package:rockets_spacex/features/rocketsInfo/data/datasource/rockets_remote_src.dart';
import 'package:rockets_spacex/features/rocketsInfo/data/datasource/rockets_remote_src_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => RocketsBloc(sl(), sl()));

  //usecases
  sl.registerLazySingleton(() => RocketsItem(sl()));
  sl.registerLazySingleton(() => RocketDetailsItem(sl()));

  //repository
  sl.registerLazySingleton<RocketsRepository>(
      () => RocketsRepositoryImpl(sl()));

  //datasource
  sl.registerLazySingleton<RocketsRemoteSrc>(() => RocketsRemoteSrcImpl());
}
