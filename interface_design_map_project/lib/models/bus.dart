import 'package:interface_design_map_project/models/routes.dart';

class Bus extends Routes {
  @override
  final String title, alert, arrivalTime, source, destination;
  String stopChange = "";
  // Routes route;
  List<String> directions = []; //walking directions to bus stop

  Bus({
    required this.title,
    required this.alert,
    required this.arrivalTime,
    required this.source,
    required this.destination,
    required busImage,
    required this.directions,
  });
}

List<Bus> createBus() {
/** These buses display on the front page.  They all start from Litchfield Towers
 * because we're pretending that the user is located there.  The app is reading the current location.
 */

  Bus bus64 = Bus(
      title: "64",
      alert: "On time",
      arrivalTime: "Arrives in 20 minutes",
      source: "Arsenal Elementary",
      destination: "Walnut St + Linden",
      busImage: "Bus 64.png", //What's this?
      directions: [
        "From Litchfield Towers, head east on 5th Ave toward Tennyson Ave."
      ]);

  Bus bus77 = Bus(
    title: "P68",
    alert: "On time",
    arrivalTime: "Arrives in 20 minutes",
    source: "The Art Institute of Pittsburgh",
    destination: "Monroeville Mall",
    busImage: "Bus P68.png",
    directions: [
      "From Litchfield Towers, head east for 300 ft on Baum Blvd toward Millvale Ave."
    ],
  );

  Bus bus61C = Bus(
    title: "61C",
    alert: "Scheduled to arrive on time\nBus is slightly crowded",
    arrivalTime: "Arrives in 1 minute.",
    source: "University of Pittsburgh",
    destination: "Kennywood",
    busImage: "Kennywood.png",
    directions: [
      "From Litchfield Towers, head southwest on Fifth Ave toward N Bouquet St",
      "Turn left onto S Bouquet St",
      "Turn left onto Forbes Ave with the destination being the bus stop 'Forbes Ave + S Bouquet' St on the right"
    ],
  );

  Bus busY49 = Bus(
    title: "Y49",
    alert: "Delayed 5 minutes\nNot crowded\n"
        "Smithfield St at Fifth Ave is temporarily out of service. New stop at Smithfield St + Forbes Ave",
    arrivalTime: "In 30 minutes",
    source: "Wood & Sixth",
    destination: "CCAC South",
    busImage: "CCAC.png",
    directions: ["From Litchfield Towers, head..."],
  );

  Bus bus71A = Bus(
    title: "71A",
    alert: "Out of service",
    arrivalTime: "TBD",
    source: "Market District",
    destination: "323 Negley Ave",
    busImage: "Out of Service.png",
    directions: [],
  );

  Bus bus82= Bus(
    title:"82",
    alert:"", 
    arrivalTime: "", 
    source: "Market Square", 
    destination: "Market District Supermarket", 
    busImage: "Bus 82.png", 
    directions: [""]);

  List<Bus> addBuses = [bus64, bus77, bus61C, busY49, bus71A, bus82];

  return addBuses;
}
