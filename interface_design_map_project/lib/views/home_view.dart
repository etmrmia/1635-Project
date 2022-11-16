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
    final viewModel = Provider.of<HomeViewModel>(context);
    // Home Page
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bus App"),
      ),
      body: Stack(
        children: [
          // Display map
          map(viewModel),
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
                  // Search Bars
                  startSearch(viewModel),
                  destinationSearch(viewModel),
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
                    child: busList(context, viewModel),
                  ),
                ],
              ),
            ),
          ),
          // Favorites Button
          Align(
            alignment: const FractionalOffset(.97, 0.02),
            child: Container(
              child: favoritesViewButton(context, viewModel),
            ),
          ),
        ],
      ),
    );
  }

// Display map method
  map(HomeViewModel vm) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.yellow,
        child: Image.asset(
          'assets/images/CCAC.png',
          fit: BoxFit.fitHeight,
        )
        //AssetImage('assets/images/CCAC.png'),
        // )
        // child: const Image(
        //   image: AssetImage('assets/images/CCAC.png'),
        // ),
        );
  }

// Display favorites button
  favoritesViewButton(BuildContext context, HomeViewModel vm) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(55, 55),
        shape: const CircleBorder(),
      ),
      onPressed: () => pushFavorites(vm),
      // onPressed: () {
      //   // Navigator.of(context).pushNamed(favoritesRoute);
      //   Navigator.pushNamed(context, favoritesRoute);
      // },
      child: const Icon(Icons.favorite),
    );
  }

  pushFavorites(HomeViewModel vm) {
    return Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => FavoritesView(favorites: vm.myList)));
  }

// Starting location search
  startSearch(HomeViewModel vm) {
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
  destinationSearch(HomeViewModel vm) {
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
              Bus line = vm.routes(_starting.text, _destination.text);
              pushBusInfo(line);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: ((context) => BusLineView(line: line))));
              //Navigator.pushNamed(context, buslineinfoRoute);
              _destination.clear();
              _starting.clear();
            }
          });
        },
      ),
    );
  }

  pushBusInfo(Bus line) {
    return Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (context) => BusLineView(line: line)));
  }

// Display list of buses
  busList(
    BuildContext context,
    HomeViewModel vm,
  ) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: ListView.builder(
          itemCount: vm.buses.length,
          itemBuilder: (context, index) {
            final favorited = vm.myList.contains(vm.buses[index]);
            return ListTile(
              title: Text(vm.buses[index].title),
              trailing: GestureDetector(
                child: Icon(
                  favorited ? Icons.favorite : Icons.favorite_border,
                  color: favorited ? Colors.red : null,
                  semanticLabel: favorited ? 'Remove from saved' : 'Save',
                ),
                onTap: () {
                  setState(() {
                    if (favorited) {
                      vm.removeFromList(vm.buses[index]);
                    } else {
                      vm.addToList(vm.buses[index]);
                    }
                  });
                },
              ),
              onTap: () {
                pushBusInfo(vm.buses[index]);
                //Navigator.pushNamed(context, buslineinfoRoute);
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
