import 'package:flutter/material.dart';
import '../models/bus.dart';
import '../views/busline_view.dart';
import '../views/favorites_view.dart';
import '../views/home_view.dart';
import 'package:provider/provider.dart';

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

final List<Bus> initialData = List.generate(
    4,
    (index) => index % 7 == 0
        //Have to figure out a way to individualize alerts
<<<<<<< HEAD
        ?Bus(title: "6$index", alert: "6$index" " - On time.", source: "Inbound-Mckeesport Transportation Center", destination: "Lysle Blvd + Locust FS", currentStop: "Walnut St + 27th FS", busImage: "")
        :Bus(title: "8$index", alert: "8$index" " - On time.", source: "", destination: "", currentStop: "", busImage: "")
        );

class HomeViewModel extends ChangeNotifier {
  Bus bus61C = Bus(title: "61C", alert: "on-time", source: "University of Pittsburgh", destination: "Kennywood", currentStop: "Bigelow Blvd", busImage: "Kennywood.png");
  Bus busY49 = Bus(title: "Y49", alert: "delayed 5 minutes", source: "Wood & Sixth", destination: "CCAC South", currentStop: "tbd", busImage: "");
  Bus noBus = Bus(title: "n/a", alert: "n/a", source: "n/a", destination: "n/a", currentStop: "n/a", busImage: "n/a");

=======
        ? Bus(
            title: "6$index",
            alert: "6$index" " - On time.",
            source: "Inbound-Mckeesport Transportation Center",
            destination: "Lysle Blvd + Locust FS",
            currentStop: "Walnut St + 27th FS")
        : Bus(
            title: "8$index",
            alert: "7$index" "C" " - On time.",
            source: "",
            destination: "",
            currentStop: "")
    //Bus(title: "7$index" "A", alert: "7$index" "A" " - On time.", source: "", destination: "", currentStop: "")
    );

class HomeViewModel extends ChangeNotifier {
  Bus bus61C = Bus(
      title: "61C McKeesport",
      alert: "on-time",
      source: "University of Pittsburgh",
      destination: "Kennywood",
      currentStop: "Bigelow Blvd");
  Bus busY49 = Bus(
      title: "Y49 Prospect Flyer",
      alert: "delayed 5 minutes",
      source: "Wood & Sixth",
      destination: "CCAC South",
      currentStop: "tbd");
  Bus noBus = Bus(
      title: "n/a",
      alert: "n/a",
      source: "n/a",
      destination: "n/a",
      currentStop: "n/a");
>>>>>>> 95f5bde6a333e665b2028160c38fd54683994fe7

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

  //Is the return value displayed at the top of screen?
  // String routes(String src, String dest) {
  //   if (src == "University of Pittsburgh" && dest == "Kennywood") {
  //     return bus61C.title;
  //   } else if (src == "Wood & Sixth" && dest == "CCAC South") {
  //     return "Y49 Prospect Flyer";
  //   } else {
  //     return "Sorry, no route exists.";
  //   }
  // }

  Bus routes(String src, String dest) {
    if (src == "University of Pittsburgh" && dest == "Kennywood") {
      return bus61C;
    } else if (src == "Wood & Sixth" && dest == "CCAC South") {
      return busY49;
    } else {
      return noBus;
    }
  }

  // String walkingInstructions(String currentStop){
    
  //   return "bus61C: instructions";
  // }
}
