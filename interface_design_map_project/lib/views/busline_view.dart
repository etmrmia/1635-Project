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
          NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  expandedHeight: MediaQuery.of(context).size.height * 2 / 3,
                  forceElevated: innerBoxIsScrolled,
                  backgroundColor: Colors.transparent,
                ),
              ];
            },
            // Information Section
            body: Container(
              padding: const EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.height / 2,
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
                  titleDisplay("Alert"),
                  // Display alert
                  Text(line.alert),
                  titleDisplay("Directions"),
                  // List of directions
                  Text(line.directions),
                  // Stop change(s), if any
                  // Text(line.stopChange), //Creates an overflow at the bottom
                  // titleDisplay("Stop Changes"),
                ],
              ),
            ),
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
  titleDisplay(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
