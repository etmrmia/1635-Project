import 'package:flutter/material.dart';
import '../views/busline_view.dart';
import '../views/favorites_view.dart';
import '../views/home_view.dart';
import 'package:provider/provider.dart';

import '../router.dart' as LocalRouter;
import '../constants.dart';

class HomeViewModel extends ChangeNotifier {
  List<String> buses = <String>["bus1", "bus2", "bus3", "bus4"];
  List<String> favorites = <String>["favorite1"];
}
