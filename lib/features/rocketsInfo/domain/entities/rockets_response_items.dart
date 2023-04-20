class Rocket {
  Rocket(
      {required this.name,
      required this.country,
      required this.engines,
      required this.flickrImages,
      required this.active,
      required this.costPerLaunch,
      required this.successRatePct,
      required this.wikipedia,
      required this.description,
      required this.id,
      required this.height,
      required this.diameter});

  String name;
  String country;
  Engines engines;
  List<String> flickrImages;
  bool active;
  int costPerLaunch;
  int successRatePct;
  String wikipedia;
  String description;
  String id;
  Diameter height;
  Diameter diameter;
}

class Engines {
  Engines({required this.number});

  int number;
}

class Diameter {
  Diameter({
    required this.meters,
    required this.feet,
  });

  double meters;
  double feet;
}
