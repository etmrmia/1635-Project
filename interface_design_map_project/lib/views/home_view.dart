import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'busline_view.dart';
import 'favorites_view.dart';
import 'home_view.dart';
import '../viewmodels/home_viewmodel.dart';
import '../models/bus.dart';
import '../router.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _starting = TextEditingController();
  final _destination = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _starting.dispose();
    _destination.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final viewModel = Provider.of<HomeViewModel>(context);
    var buses = context.watch<HomeViewModel>().buses;
    var favorites = context.watch<HomeViewModel>().myList;
    // Home Page
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bus App"),
      ),
      body: Stack(
        children: [
          // Display map
          map(),
          NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  expandedHeight: MediaQuery.of(context).size.height / 2,
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
                  // Search Bars
                  startSearch(),
                  destinationSearch(),
                  // Bus List
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Buses",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: busList(buses, favorites),
                  ),
                ],
              ),
            ),
          ),
          // Favorites Button
          Align(
            alignment: const FractionalOffset(.97, 0.02),
            child: Container(
              child: favoritesViewButton(),
            ),
          ),
        ],
      ),
    );
  }

// Display map method
  map() {
    return Container(
      color: Colors.yellow,
      // child: const Image(
      //   image: AssetImage('assets/images/CCAC.png'),
      // ),
    );
  }

// Display favorites button
  favoritesViewButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(55, 55),
        shape: const CircleBorder(),
      ),
      // onPressed: (() => _pushSaved(vm)),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FavoritesView()));
        // Navigator.pushNamed(context, favoritesRoute);
      },
      child: const Icon(Icons.favorite),
    );
  }

// Starting location search
  startSearch() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: TextFormField(
        controller: _starting,
        decoration: const InputDecoration(
          labelText: "Starting",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        ),
      ),
    );
  }

// Destination search
  destinationSearch() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        controller: _destination,
        textInputAction: TextInputAction.send,
        decoration: const InputDecoration(
          labelText: "Destination",
          focusedBorder: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        ),
        onFieldSubmitted: (value) {
          setState(() {
            if (_destination.text.isNotEmpty) {
              _destination.clear();
              _starting.clear();
              Navigator.pushNamed(context, buslineinfoRoute);
            }
          });
        },
      ),
    );
  }

// Display list of buses
  busList(List<Bus> buses, List<Bus> favorites) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: ListView.builder(
          itemCount: buses.length,
          itemBuilder: (context, index) {
            final favorited = favorites.contains(buses[index]);
            return ListTile(
              title: Text(buses[index].title),
              trailing: GestureDetector(
                child: Icon(
                  favorited ? Icons.favorite : Icons.favorite_border,
                  color: favorited ? Colors.red : null,
                  semanticLabel: favorited ? 'Remove from saved' : 'Save',
                ),
                onTap: () {
                  setState(() {
                    if (favorited) {
                      // vm.removeFromList(vm.buses[index]);
                      context.read<HomeViewModel>().addToList(buses[index]);
                    } else {
                      context.read<HomeViewModel>().addToList(buses[index]);
                    }
                  });
                },
              ),
              onTap: () {
                Navigator.pushNamed(context, buslineinfoRoute);
              },
            );
          },
        ),
      ),
    );
  }

  void _pushSaved(HomeViewModel vm) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = vm.myList.map(
            (pair) {
              return ListTile(
                title: Text(pair.title),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Favorites'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
