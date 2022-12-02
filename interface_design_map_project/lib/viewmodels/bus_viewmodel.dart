import 'package:flutter/material.dart';
import 'package:interface_design_map_project/models/routes.dart';
import 'package:interface_design_map_project/models/bus.dart';
import 'package:interface_design_map_project/viewmodels/routes_viewmodel.dart';
import '../views/busline_view.dart';
import '../views/favorites_view.dart';
import '../views/home_view.dart';
import 'package:provider/provider.dart';

import '../router.dart' as LocalRouter;
import '../constants.dart';


class BusViewModel extends ChangeNotifier {
  // int s = 0;
  final Bus bus;
  // Routes route=Routes();
 
  BusViewModel({required this.bus});

  String get title{
    return bus.title;
  }

  String get alert{
    return bus.alert;
  }

  String get source{
    return bus.source;
  }

   String get destination{
    return bus.destination;
  }

  String get currentStop{
    return bus.currentStop;
  }

  String get busImage{
    return bus.busImage;
  }

}