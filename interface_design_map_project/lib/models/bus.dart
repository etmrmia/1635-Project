import 'package:interface_design_map_project/models/routes.dart';

class Bus extends Routes {
  @override
  final String title, alert, arrivalTime, source, destination;
  String stopChange = "";
  // Routes route;
  List<String> directions = []; //walking directions to bus stop
  List<String> times = [];

  Bus({
    required this.title,
    required this.alert,
    required this.arrivalTime,
    required this.source,
    required this.destination,
    required busImage,
    required this.directions,
    required this.times,
  });
}

List<Bus> createBus() {
/** These buses display on the front page.  They all start from Litchfield Towers
 * because we're pretending that the user is located there.  The app is reading the current location.
 */

  //Parent persona
  Bus bus64 = Bus(
      title: "64 Lawrenceville",
      alert: "On time",
      arrivalTime: "Arrives in 20 minutes",
      source: "Arsenal Elementary",
      destination: "Bank of America",
      busImage: "Bus 64.png",
      directions: [
        "From Arsenal Elementary School, walk to 39th St + Butler",
        "Board on 39th + Butler",
        "Get off at Walnut St + S Negley Ave"
      ],
      times: [
        "3:15 pm",
        "3:41 pm",
        "4:02 pm"
      ]);

  Bus busP68 = Bus(
      title: "P68 Braddock Hills Flyer",
      alert: "On time",
      arrivalTime: "Arrives in 20 minutes",
      source: "Art Institute",
      destination: "Monroeville Mall",
      busImage: "Bus P68.png",
      directions: [
        "From 225 Penn Ave, head southwest on Penn Ave toward 14th St",
        "Turn left onto 11th St",
        "Turn right on Liberty Ave",
        "Board on Liberty + 10th",
        "Get off at Monroeville Mall, 200 Mall Cir Dr, Monroeville, PA 15146"
      ],
      times: [
        "2:47 pm",
        "2:55 pm",
        "3:00 pm",
        "3:09 pm",
        "4:23 pm"
      ]);

  Bus bus61C = Bus(
      title: "61C McKeesport",
      alert: "Scheduled to arrive on time\nBus is slightly crowded",
      arrivalTime: "Arrives in 1 minute.",
      source: "University of Pittsburgh",
      destination: "Kennywood",
      busImage: "Kennywood.png",
      directions: [
        "From Litchfield Towers, head southwest on Fifth Ave toward N Bouquet St",
        "Turn left onto S Bouquet St",
        "Turn left onto Forbes Ave",
        "Board on Forbes Ave + S Bouquet",
        "Get off at Kennywood Blvd + Hoffman Ave",
      ],
      times: [
        "1:20 pm",
        "1:23 pm",
        "1:25 pm",
        "1:32 pm",
        "2:06 pm"
      ]);

  Bus busY49 = Bus(
      title: "Y49 IP Prospect Flyer",
      alert: "Delayed 5 minutes\nNot crowded\n"
          "Smithfield St at Fifth Ave is temporarily out of service. New stop at Smithfield St + Forbes Ave",
      arrivalTime: "In 30 minutes",
      source: "Wood St",
      destination: "CCAC South",
      busImage: "CCAC.png",
      directions: [
        "From Wood St + 5th Ave, walk toward Wood St + 6th Ave",
        "Board at Wood St + 6th Ave",
        "Get off at South Campus Driveway + Library Entrance",
      ],
      times: [
        "7:11 pm",
        "7:13 pm",
        "8:02 pm"
      ]);

  Bus bus71A = Bus(
      title: "71A Negley",
      alert: "Out of service",
      arrivalTime: "TBD",
      source: "Market District",
      destination: "323 Negley Ave",
      busImage: "Out of Service.png",
      directions: ["Sorry, no directions are available for this route."],
      times: ["TBD"]);

  Bus bus82 = Bus(
      title: "82 Lincoln",
      alert: "On time",
      arrivalTime: "Arrives in 1 minute",
      source: "Market Square",
      destination: "Market District",
      busImage: "Bus 82.png",
      directions: [
        "From Market Square, head northwest toward Market St",
        "Turn right onto Market St",
        "Board at Liberty Ave + Market St",
        "Get off at Centre Ave + Negley Ave (Market District)"
      ],
      times: [
        "4:05 pm",
        "4:07 pm",
        "4:23 pm",
        "4:50 pm"
      ]);

  List<Bus> addBuses = [bus64, busP68, bus61C, busY49, bus71A, bus82];

  return addBuses;
}
