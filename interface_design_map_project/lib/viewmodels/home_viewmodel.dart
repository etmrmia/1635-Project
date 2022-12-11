import 'package:flutter/material.dart';
import '../models/bus.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();

final List<Bus> busList = createBus();

class HomeViewModel extends ChangeNotifier {
  //A bus for no bus
  Bus noBus = Bus(
    title: "No bus exists for this route",
    alert: "N/A",
    arrivalTime: "N/A",
    source: "N/A",
    destination: "N/A",
    homeBusImage: "Out of Service.png",
    routeBusImage: "Out of Service.png",
    directions: ["N/A"],
    times: ["N/A"],
  );

  final List<Bus> _buses = busList;

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

  // Returns bus from source and destination
  Bus routes(String src, String dest) {
    for (int i = 0; i < _buses.length; i++) {
      if (_buses[i].source == src && _buses[i].destination == dest) {
        //buses[i].busImage="";
        return buses[i];
      }
    }
    return noBus;
  }
}
