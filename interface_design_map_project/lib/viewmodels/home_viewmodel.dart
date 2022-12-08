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
final List<Bus> initialData = List.generate(
    6,
    (index) => index % 7 == 0
        /* I think we're going to need individual buses to display,
        unless we don't care about generic instructions being shared by these random ones. */
        ? Bus(
            title: "6$index",
            alert: "On time",
            arrivalTime: "in 20 minutes",
            source: "Walnut St + Linden",
            destination: "Young St + Yester",
            currentStop: "Walnut St + 27th FS",
            busImage: "Bus 60.png",
            directions:
                "From Litchfield....", //Same directions for these buses.  Does that matter?
          )
        : Bus(
            title: "8$index",
            alert: "On time",
            arrivalTime: "Arrives in 5 minutes",
            source: "",
            destination: "",
            currentStop: "",
            busImage: "",
            directions: "From Litchfield...."));

class HomeViewModel extends ChangeNotifier {
  Bus bus61C = Bus(
      title: "61C",
      alert: "Scheduled to arrive on time\nBus is slightly crowded",
      arrivalTime: "Arrives in 1 minute.",
      source: "University of Pittsburgh",
      destination: "Kennywood",
      currentStop: "Litchfield Towers", //What are we doing with this variable?
      busImage: "Kennywood.png",
      directions:
          "From Litchfield Towers, head southwest on Fifth Ave toward N Bouquet St\nTurn left onto S Bouquet St\nTurn left onto Forbes Ave with the destination being the bus stop 'Forbes Ave + S Bouquet' St on the right",
      stopChange: "No stop changes");
  Bus busY49 = Bus(
      title: "Y49",
      alert: "Delayed 5 minutes\nNot crowded",
      arrivalTime: "in 30 minutes",
      source: "Wood & Sixth",
      destination: "CCAC South",
      currentStop: "", //What are we doing with this variable?
      busImage: "CCAC.png",
      directions: "From 5th and Wood, head...",
      stopChange:
          "Smithfield St at Fifth Ave is temporarily out of service\n New stop at Smithfield St + Forbes Ave");
  Bus noBus = Bus(
      title: "n/a",
      alert: "n/a",
      arrivalTime: "n/a",
      source: "n/a",
      destination: "n/a",
      currentStop: "n/a",
      busImage: "n/a",
      directions: "n/a",
      stopChange: "n/a");

  final List<Bus> _buses = initialData;

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
    if (src == "University of Pittsburgh" && dest == "Kennywood") {
      return bus61C;
    }
    return noBus;
  }
}
