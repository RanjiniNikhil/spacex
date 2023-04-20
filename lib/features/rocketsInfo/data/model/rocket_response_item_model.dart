import 'package:rockets_spacex/features/rocketsInfo/domain/entities/rockets_response_items.dart';

class RocketItemModel extends Rocket {
  RocketItemModel({
    required String name,
    required String country,
    required EnginesItemModel engines,
    required List<String> flickrImages,
    required bool active,
    required int costPerLaunch,
    required int successRatePct,
    required String wikipedia,
    required String description,
    required String id,
    required DiameterItemModel height,
    required DiameterItemModel diameter,
  }) : super(
            name: name,
            country: country,
            engines: engines,
            flickrImages: flickrImages,
            active: active,
            costPerLaunch: costPerLaunch,
            successRatePct: successRatePct,
            wikipedia: wikipedia,
            description: description,
            id: id,
            height: height,
            diameter: diameter);

  factory RocketItemModel.fromJson(Map<String, dynamic> json) {
    RocketItemModel rocketItemModel = RocketItemModel(
      name: json["name"],
      country: json["country"],
      engines: EnginesItemModel.fromJson(json["engines"]),
      flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
      active: json["active"],
      costPerLaunch: json["cost_per_launch"],
      successRatePct: json["success_rate_pct"],
      wikipedia: json["wikipedia"],
      description: json["description"],
      id: json["id"],
      height: DiameterItemModel.fromJson(json["height"]),
      diameter: DiameterItemModel.fromJson(json["diameter"]),
    );
    return rocketItemModel;
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "country": country,
        "engines": engines,
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
        "active": active,
        "cost_per_launch": costPerLaunch,
        "success_rate_pct": successRatePct,
        "wikipedia": wikipedia,
        "description": description,
        "id": id,
        "height": height,
        "diameter": diameter,
      };
}

class EnginesItemModel extends Engines {
  EnginesItemModel({required int number}) : super(number: number);

  factory EnginesItemModel.fromJson(Map<String, dynamic> json) {
    EnginesItemModel enginesItemModel = EnginesItemModel(
      number: json["number"],
    );
    return enginesItemModel;
  }

  Map<String, dynamic> toJson() => {
        "number": number,
      };
}

class DiameterItemModel extends Diameter {
  DiameterItemModel({
    required double meters,
    required double feet,
  }) : super(meters: meters, feet: feet);

  factory DiameterItemModel.fromJson(Map<String, dynamic> json) {
    DiameterItemModel diameterItemModel = DiameterItemModel(
      meters: json["meters"].toDouble(),
      feet: json["feet"].toDouble(),
    );
    return diameterItemModel;
  }

  Map<String, dynamic> toJson() => {
        "meters": meters,
        "feet": feet,
      };
}
