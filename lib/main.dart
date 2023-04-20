import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rockets_spacex/bloc/base_bloc.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_bloc.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_event.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/pages/get_rockets_info.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/pages/rocket_details.dart';
import 'package:rockets_spacex/routes.dart';
import 'package:rockets_spacex/features/rocketsInfo/injection_rocketsInfo.dart'
    as slRockets;

Future<void> main() async {
  Bloc.observer = BaseBloc();
  await Future.wait([slRockets.init()]);
  FluroRouter router = new FluroRouter();
  Application.router = router;
  router.define(AppRoutes.rocketDetailsPage,
      handler: new Handler(handlerFunc: (context, Map<String, dynamic> params) {
    final args = ModalRoute.of(context!)!.settings.arguments as String;
    return BlocProvider(
      create: (context) =>
          slRockets.sl<RocketsBloc>()..add(RocketDetailsEvent(args)),
      child: RocketDetails(id: args),
    );
  }));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => slRockets.sl<RocketsBloc>()..add(RocketsEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GetRocketsInfo(),
      ),
    );
  }
}
