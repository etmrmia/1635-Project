import 'package:interface_design_map_project/models/routes.dart';

class Bus extends Routes {
  final String title, alert, arrivalTime;
  String stopChange = "";
  // Routes route;
List<String> directions = []; //walking directions to bus stop

  Bus(
      {required this.title,
      required this.alert,
      required this.arrivalTime,
      source,
      destination,
      currentStop,
      required busImage,
      required this.directions,
      stopChange});
}
