class Routes {

  final String source;
  final String currentStop;
  final String destination;
  final String map;
  final String alert;
  
  
  Routes({required this.source, required this.currentStop, required this.destination, required this.map, required this.alert});

  factory Routes.fromJson(Map<String, dynamic> json) {
    return Routes(
        source: json["source"],
        currentStop: json["current_stop"],
        destination:  json["destination"],
        map: json["mapUrl"],
        alert: json["alerts"]
    );
  }

}