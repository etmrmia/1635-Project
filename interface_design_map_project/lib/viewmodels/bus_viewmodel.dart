import 'package:flutter/material.dart';
import 'package:interface_design_map_project/models/routes.dart';
import '../views/busline_view.dart';
import '../views/favorites_view.dart';
import '../views/home_view.dart';
import 'package:provider/provider.dart';

import '../router.dart' as LocalRouter;
import '../constants.dart';


class Bus extends ChangeNotifier {
  int s = 0;
  Routes route=Routes();
}
