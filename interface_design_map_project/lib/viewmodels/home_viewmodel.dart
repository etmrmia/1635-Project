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
    3,
    (index) =>
        //Have to figure out a way to individualize alerts
        Bus(title: "7$index" "C", alert: "On time."));

class HomeViewModel with ChangeNotifier {
  Bus bus61C = Bus(title: "61C McKeesport", alert: "on-time");
  Bus busY49 = Bus(title: "Y49 Prospect Flyer", alert: "delayed");
  Bus noBus = Bus(title: "N/A", alert: "n/a");

  final List<Bus> _buses = initialData;

  // Retrieve all buses
  List<Bus> get buses => _buses;

  // Favorite buses
  final List<Bus> _myList = [
    Bus(alert: "test1", title: "test1"),
    Bus(alert: "test2", title: "test2")
  ];

  // Retrieve favorite buses
  List<Bus> get myList => _myList;

  // Adding a bus to the favorites list
  void addToList(Bus bus) {
    print("adding " + bus.title);
    _myList.add(bus);
    print("my fave list: ");
    for (int i = 0; i < myList.length; i++) {
      print(myList[i].title);
    }
    notifyListeners();
  }

  // Removing a bus from the favorites list
  void removeFromList(Bus bus) {
    print("removing " + bus.title);
    _myList.remove(bus);
    print("my fave list: ");
    for (int i = 0; i < myList.length; i++) {
      print(myList[i].title);
    }
    notifyListeners();
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
