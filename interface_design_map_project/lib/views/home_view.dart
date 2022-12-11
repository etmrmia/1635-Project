import 'package:flutter/material.dart';
import 'busline_view.dart';
import 'favorites_view.dart';
import '../viewmodels/home_viewmodel.dart';
import '../models/bus.dart';
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
                  const Divider(),
                  // PRT Phone number
                  Semantics(
                    label:
                        "Pittsburgh Regional Transit Phone Number: 1 (412) 442-2000",
                    child: const Text(
                        "Pittsburgh Regional Transit: 1 (412) 442-2000"),
                  ),

                  // Search Bars
                  Semantics(
                    label: "Search starting location",
                    textField: true,
                    child: startSearch(viewModel),
                  ),
                  Semantics(
                    label: "Search destination",
                    textField: true,
                    child: destinationSearch(viewModel),
                  ),
                  // Bus List
                  Semantics(
                    label: "Bus list",
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Buses",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
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
              child: Semantics(
                label: "View List of Favorite Buses",
                button: true,
                child: favoritesViewButton(context, viewModel),
              ),
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
      child: Image.asset(
        'assets/images/Pittsburgh Map.png',
        fit: BoxFit.fitHeight,
      ),
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
      child: const Icon(Icons.favorite),
    );
  }

  // Push favorites view
  pushFavorites(HomeViewModel vm) {
    return Navigator.of(context)
        .push(
      MaterialPageRoute<void>(
        builder: (_) => ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
          child: FavoritesView(favorites: vm.myList),
        ),
      ),
    )
        .then((_) {
      setState(() {});
    });
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
              Bus line = vm.routes(_starting.text, _destination.text); //no
              pushBusInfo(line, true);
              _destination.clear();
              _starting.clear();
            }
          });
        },
      ),
    );
  }

  // Push bus info view
  pushBusInfo(Bus line, bool isSearched) {
    return Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => BusLineView(
              line: line,
              isSearched: isSearched,
            )));
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
            return Semantics(
              label: vm.buses[index].title,
              child: ListTile(
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
                  pushBusInfo(vm.buses[index], false);
                  //Navigator.pushNamed(context, buslineinfoRoute);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
