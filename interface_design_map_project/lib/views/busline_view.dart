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
                  expandedHeight: MediaQuery.of(context).size.height * 3 / 5,
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
                  const Divider(height: 7),
                  Semantics(
                    label: "Alert",
                    child: titleDisplay("Alert"),
                  ),
                  // Display alert
                  Semantics(
                    label: line.alert,
                    child: Text(
                      line.alert,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  const Divider(),
                  const Divider(
                    thickness: 1,
                    indent: 20,
                    color: Colors.grey,
                    endIndent: 20,
                  ),
                  Semantics(
                    label: "Directions",
                    child: titleDisplay("Directions"),
                  ),
                  // List of directions
                  Expanded(
                    child: busDirections(line, context),
                  ),
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

  busDirections(Bus line, BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: ListView.builder(
          itemCount: line.directions.length,
          itemBuilder: (context, index) {
            return Semantics(
              label: line.directions[index],
              child: ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                title: Text(
                  line.directions[index],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
