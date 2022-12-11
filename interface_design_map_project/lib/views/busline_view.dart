import 'package:flutter/material.dart';
import '../models/bus.dart';

class BusLineView extends StatelessWidget {
  final Bus line;
  final bool isSearched;
  const BusLineView({super.key, required this.line, required this.isSearched});

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
                  expandedHeight:
                      MediaQuery.of(context).size.height * 3 / 5 - 30,
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
                child: displayDirections(context)),
          ),
        ],
      ),
    );
  }

  // Display map
  map(BuildContext context) {
    String image;
    if (isSearched) {
      image = "assets/images/" + line.routeBusImage;
    } else {
      image = "assets/images/" + line.homeBusImage;
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        image,
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

  // Display list of bus directions
  busDirections(BuildContext context) {
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
                leading: Text((index + 1).toString() + "."),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                title: Text(
                  line.directions[index],
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: Text(line.times[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  // Different displays based on isSearched
  displayDirections(BuildContext context) {
    if (isSearched) {
      return Column(
        children: [
          const Divider(height: 7),
          Semantics(
            label: "Alert",
            child: titleDisplay("Alert"),
          ),
          // Display alert
          Semantics(
            label: line.alert,
            child: displayAlert(),
          ),
          const Divider(),
          Semantics(
            label: line.arrivalTime,
            child: Text(
              line.arrivalTime,
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
            child: busDirections(context),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          const Divider(height: 7),
          Semantics(
            label: "Alert",
            child: titleDisplay("Alert"),
          ),
          // Display alert
          Semantics(
            label: line.alert,
            child: displayAlert(),
          ),
        ],
      );
    }
  }

  // Alert Display
  displayAlert() {
    return Text(
      line.alert,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 14),
    );
  }
}
