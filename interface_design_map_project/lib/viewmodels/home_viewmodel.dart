import 'package:flutter/material.dart';
import '../views/busline_view.dart';
import '../views/favorites_view.dart';
import '../views/home_view.dart';
import 'package:provider/provider.dart';

import '../router.dart' as LocalRouter;
import '../constants.dart';

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
