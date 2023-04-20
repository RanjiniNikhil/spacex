import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rockets_spacex/bloc/base_state.dart';
import 'package:rockets_spacex/features/rocketsInfo/domain/entities/rockets_response_items.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_bloc.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_event.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/bloc/rockets_state.dart';
import 'package:rockets_spacex/features/rocketsInfo/presentation/widgets/rockets_widgets.dart';
import 'package:rockets_spacex/stringConstant.dart';

class RocketDetails extends StatefulWidget {
  String id;

  RocketDetails({required this.id, Key? key}) : super(key: key);

  @override
  State<RocketDetails> createState() => _RocketDetailsState();
}

class _RocketDetailsState extends State<RocketDetails> {
  late RocketsBloc rocketsBloc;

  @override
  void initState() {
    super.initState();
    rocketsBloc = BlocProvider.of<RocketsBloc>(context);
  }

  Widget view(BuildContext context) {
    late Rocket rockets;
    return BlocBuilder<RocketsBloc, BaseState>(builder: (context, state) {
      if (state is StateLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is StateErrorGeneral) {
        return errorWidget(
          () {
            rocketsBloc.add(RocketDetailsEvent(widget.id));
          },
        );
      } else {
        if (state is RocketDetailsStateOnSuccess) {
          rockets = state.response;
        }

        return Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                rockets.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              flickerImage(
                  height: 180,
                  width: 160,
                  flickerImages: rockets.flickrImages,
                  margin: EdgeInsets.only(right: 10, top: 20, bottom: 20)),
              details(StringConstant.activeStatus, rockets.active.toString()),
              details(StringConstant.costPerlaunch,
                  rockets.costPerLaunch.toString()),
              details(StringConstant.successRatePercentage,
                  rockets.successRatePct.toString()),
              details(StringConstant.description, rockets.description),
              details(StringConstant.wikipedia, rockets.wikipedia),
              diameterWidget(StringConstant.height, rockets.height.meters,
                  rockets.height.feet),
              diameterWidget(StringConstant.diameter, rockets.diameter.meters,
                  rockets.diameter.feet)
            ],
          ),
        );
      }
    });
  }

  Widget details(String type, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Text(type + value),
    );
  }

  Widget diameterWidget(String type, double meters, double feet) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Text(type +
          ":  " +
          StringConstant.meter +
          meters.toString() +
          StringConstant.feet +
          feet.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(StringConstant.rocketDetails),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: view(context),
    );
  }
}
