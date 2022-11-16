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

//Dummy data
final List<Bus> initialData = List.generate(
    20,
    (index) =>
        //Have to figure out a way to individualize alerts
        Bus(title: "7$index" "C", alert: "On time."));

class HomeViewModel extends ChangeNotifier {
  Bus bus61C = Bus(title: "61C McKeesport", alert: "on-time");
  Bus busY49 = Bus(title: "Y49 Prospect Flyer", alert: "delayed");
  Bus bus61D = Bus(title: "61D Murray", alert: "on-time");
  Bus bus71A = Bus(title: "71A Negley", alert: "delayed");
  Bus bus71C = Bus(title: "71C Point Breeze", alert: "on-time");
  Bus bus58 = Bus(title: "58 Greenfield", alert: "delayed");
  Bus noBus = Bus(title: "N/A", alert: "n/a");

  final List<Bus> _buses = initialData;
  // [
  //   Bus(title: "61C McKeesport", alert: "on-time"),
  //   Bus(title: "Y49 Prospect Flyer", alert: "delayed"),
  //   Bus(title: "61D Murray", alert: "on-time"),
  //   Bus(title: "71A Negley", alert: "delayed"),
  //   Bus(title: "71C Point Breeze", alert: "on-time"),
  //   Bus(title: "58 Greenfield", alert: "delayed"),
  // ];

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

  // Gets bus from string
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
}


/* testing
class HomeViewModel extends ChangeNotifier {
  List<String> buses = <String>[
    "bus1",
    "bus2",
    "bus3",
    "bus4",
    "bus5",
    "bus6",
    "bus7",
    "bus8",
    "bus9",
    "bus10",
    "bus11",
    "bus12",
    "bus13",
    "bus14",
    "bus15",
    "bus16",
    "bus17",
    "bus18",
    "bus19"
  ];
  List<String> favorites = <String>["favorite1", "favorite2", "favorite3"];
  ValueNotifier<int> favLen = ValueNotifier<int>(2);

  addFavorite(String favorite) {
    favorites.add(favorite);
    print("adding " + favorite);
    for (int i = 0; i < favorites.length; i++) print(favorites[i]);
    notifyListeners();
  }

  removeFavorite(String favorite) {
    favorites.remove(favorite);
    print("removing " + favorite);
    for (int i = 0; i < favorites.length; i++) print(favorites[i]);
    notifyListeners();
  }
}
*/
