import 'package:flutter/material.dart';
import '../constants.dart';
import 'busline_view.dart';
import 'favorites_view.dart';
import 'home_view.dart';
import '../viewmodels/home_viewmodel.dart';
import '../router.dart';
import 'package:provider/provider.dart';
import '../models/bus.dart';

class BusLineView extends StatelessWidget {
  final Bus line;
  const BusLineView({super.key, required this.line});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(line.title),
      ),
      body: Stack(
        children: [
          map(context),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 5,
            alignment: Alignment.topCenter,
            child: alertsBox(),
          ),
        ],
      ),
    );
  }

  // Display map
  map(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/images/CCAC.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  // Display alerts
  alertsBox() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 9,
            spreadRadius: 3,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Alert",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Expanded(
            child: Text(line.alert),
          ),
        ],
      ),
    );
  }
}
