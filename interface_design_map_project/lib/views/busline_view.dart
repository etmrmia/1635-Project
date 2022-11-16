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
        title: const Text("buslines"),
      ),
      body: Stack(
        children: [
          map(),
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

  map() {
    return Container(
      color: Colors.amberAccent,
    );
  }

  alertsBox() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text("Alert"),
          Text(line.alert),
        ],
      ),
    );
  }
}
