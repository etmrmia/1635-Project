import 'package:flutter/material.dart';
import '../models/bus.dart';
import '../views/busline_view.dart';
import '../views/favorites_view.dart';
import '../views/home_view.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

/*import '../router.dart' as LocalRouter;
import '../constants.dart';

class HomeViewModel extends StatefulWidget {
  const HomeViewModel({super.key});

  @override
  State<HomeViewModel> createState() => _HomeViewModelState();
}

class _HomeViewModelState extends State<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
final player = AudioPlayer();
//   await player.setSource(AssetSource('sounds/coin.wav'));
Bus bus61C = Bus(
    title: "61C",
    alert: "on-time, slightly crowded",
    arrivalTime: "in 1 minute",
    source: "University of Pittsburgh",
    destination: "Kennywood",
    currentStop: "Litchfield Towers",
    busImage: "Kennywood.png",
    directions: [
      "From Litchfield towers, head southwest on Fifth Ave toward N Bouquet St",
      "Turn left onto S Bouquet St",
      "Turn left onto Forbes Ave with the destination being the bus stop 'Forbes Ave + Bouquet' St on the right"
    ]);
Bus bus60 = Bus(
    title: "60",
    alert: "Semi-crowded\n" "The bus stop Smithfield St at Fifth Ave is temporarily out of service, please go to Smithfield St + Forbes Ave",
    arrivalTime: "in 20 minutes",
    source: "Walnut St + Linden",
    destination: "Young St + Yester",
    currentStop: "Walnut St & 27th FS",
    busImage: "Bus 60.png",
    directions: ["direction 1", "direction2"]);
Bus busY49 = Bus(
    title: "Y49",
    alert: "delayed 5 minutes, not crowded",
    arrivalTime: "in 30 minutes",
    source: "Wood & Sixth",
    destination: "CCAC South",
    currentStop: "tbd",
    busImage: "CCAC.png",
    directions: ["From 5th and Wood, head..."]);
Bus noBus = Bus(
    title: "n/a",
    alert: "n/a",
    arrivalTime: "n/a",
    source: "n/a",
    destination: "n/a",
    currentStop: "n/a",
    busImage: "n/a",
    directions: ["n/a"]);
List<Bus> busData = [bus61C, bus60, busY49];

class HomeViewModel extends ChangeNotifier {
  Bus bus61C = Bus(
      title: "61C",
      alert: "Scheduled to arrive on time\nBus is slightly crowded",
      arrivalTime: "Arrives in 1 minute.",
      source: "University of Pittsburgh",
      destination: "Kennywood",
      currentStop: "Litchfield Towers", //What are we doing with this variable?
      busImage: "Kennywood.png",
      directions: [
        "From Litchfield Towers, head southwest on Fifth Ave toward N Bouquet St",
        "Turn left onto S Bouquet St",
        "Turn left onto Forbes Ave with the destination being the bus stop 'Forbes Ave + S Bouquet' St on the right"
      ],
      );
  Bus busY49 = Bus(
      title: "Y49",
      alert: "Delayed 5 minutes\nNot crowded\n""Smithfield St at Fifth Ave is temporarily out of service. New stop at Smithfield St + Forbes Ave",
      arrivalTime: "in 30 minutes",
      source: "Wood & Sixth",
      destination: "CCAC South",
      currentStop: "", //What are we doing with this variable?
      busImage: "CCAC.png",
      directions: ["From 5th and Wood, head..."],
    );
  Bus noBus = Bus(
      title: "n/a",
      alert: "n/a",
      arrivalTime: "n/a",
      source: "n/a",
      destination: "n/a",
      currentStop: "n/a",
      busImage: "n/a",
      directions: ["n/a"],
     );

  final List<Bus> _buses = busData;

  // Retrieve all buses
  List<Bus> get buses => _buses;

  // Favorite buses
  final List<Bus> _myList = [];

  // Retrieve favorite buses
  List<Bus> get myList => _myList;

  // Adding a bus to the favorites list
  void addToList(Bus bus) {
    _myList.add(bus);
    notifyListeners();
  }

  // Removing a bus from the favorites list
  void removeFromList(Bus bus) {
    _myList.remove(bus);
    notifyListeners();
  }

  // Returns bus from string
  Bus getBus(String line) {
    for (int i = 0; i < _buses.length; i++) {
      if (_buses[i].title == line) {
        return _buses[i];
      }
    }
    return noBus;
  }

  //Just testing
  Bus routes(String src, String dest) {
   for (Bus bus in busData){
      if (bus.source=="University of Pittsburgh" && bus.destination=="Kennywood"){
        return bus61C;
      }
      else if (bus.source=="Wood & Sixth" && bus.destination=="CCAC South"){
        return busY49;
      }
      else if (bus.source=="Walnut St + Linden" && bus.destination=="Young St + Yester"){
        return bus60;
      }

    }
    return noBus; //no match
}
}