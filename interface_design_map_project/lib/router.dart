import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'views/busline_view.dart';
import 'views/favorites_view.dart';
import 'views/home_view.dart';
import 'viewmodels/home_viewmodel.dart';
import 'router.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => HomeViewModel(),
                  child: HomeView(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
