import 'package:flutter/material.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_event.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/widgets/rockets_widgets.dart';
import 'package:rockets_spacex/routes.dart';
import 'package:rockets_spacex/stringConstant.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_bloc.dart';
import 'package:rockets_spacex/bloc/base_state.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/entities/rockets_response_items.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetRocketsInfo extends StatefulWidget {
  const GetRocketsInfo({Key? key}) : super(key: key);

  @override
  State<GetRocketsInfo> createState() => _GetRocketsInfoState();
}

class _GetRocketsInfoState extends State<GetRocketsInfo> {
  late RocketsBloc rocketsBloc;

  @override
  void initState() {
    super.initState();
    rocketsBloc = BlocProvider.of<RocketsBloc>(context);
  }

  Widget view(BuildContext context) {
    late List<Rocket> rockets;
    return BlocBuilder<RocketsBloc, BaseState>(builder: (context, state) {
      if (state is StateLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is StateErrorGeneral) {
        return errorWidget(
          () {
            rocketsBloc.add(RocketsEvent());
          },
        );
      } else {
        if (state is RocketsStateOnSuccess) {
          rockets = state.response;
        }

        return ListView.separated(
          itemCount: rockets.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Application.router.navigateTo(
                    context, AppRoutes.rocketDetailsPage,
                    routeSettings: RouteSettings(arguments: rockets[index].id));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringConstant.name + rockets[index].name),
                    Text(StringConstant.country + rockets[index].country),
                    Text(StringConstant.enginesCount +
                        rockets[index].engines.number.toString()),
                    flickerImage(
                        height: 100,
                        width: 100,
                        flickerImages: rockets[index].flickrImages,
                        margin: EdgeInsets.only(right: 10, top: 10)),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              Divider(thickness: 1.0, color: Colors.grey.shade400),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(StringConstant.rockets),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: view(context),
    );
  }
}
