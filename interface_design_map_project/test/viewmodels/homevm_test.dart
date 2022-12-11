//import 'package:test/test.dart';
//import 'package:ui_testing/viewmodels/home_viewmodel.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:interface_design_map_project/models/bus.dart';
import 'package:interface_design_map_project/viewmodels/home_viewmodel.dart';

void main() {
  Bus busTest = Bus(
      title: "",
      alert: "test alert",
      arrivalTime: "test time",
      source: "Pittsburgh",
      destination: "Biloxi",
      homeBusImage: "None",
      routeBusImage: "None",
      directions: ["Drive south"],
      times: ["18 hours"]);

  group('Testing App Provider', () {
    var favorites = HomeViewModel();
    var findItem = HomeViewModel();

    test('A new item should be added', () {
      favorites.addToList(busTest);
      expect(favorites.myList.contains(busTest), true);
    });

    test('An item should be removed', () {
      favorites.removeFromList(busTest);
      expect(favorites.myList.contains(busTest), false);
    });

    test('An item should be found', () {
      String findBus = 'P68 Braddock Hills Flyer';
      Bus b = findItem.getBus(findBus);
      expect(b.title, findBus);
    });
  });

  test('A route should not be found', () {
    String src = "Penn", dest = "Brookline";
    var findItem = HomeViewModel(); //Why did I have to redefine this variable?
    Bus b = findItem.routes(src, dest);
    expect(b.title, "No bus exists for this route");
  });
}
