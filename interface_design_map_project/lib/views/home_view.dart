import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'busline_view.dart';
import 'favorites_view.dart';
import 'home_view.dart';
import '../viewmodels/home_viewmodel.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bus App"),
      ),
      body: Stack(
        children: [
          map(viewModel),
          NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  expandedHeight: MediaQuery.of(context).size.height / 2,
                  //collapsedHeight: MediaQuery.of(context).size.height / 4,
                  forceElevated: innerBoxIsScrolled,
                  backgroundColor: Colors.transparent,
                ),
              ];
            },
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
                  startSearch(viewModel, _starting),
                  destinationSearch(viewModel, _starting, _destination),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Buses",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  busList(context, viewModel),
                ],
              ),
            ),
          ),
          Align(
            alignment: const FractionalOffset(.97, 0.02),
            child: Container(
              child: favoritesViewButton(context),
            ),
          ),
        ],
      ),
    );
  }

  map(HomeViewModel vm) {
    return Container(
      color: Colors.lightGreen,
    );
  }

  favoritesViewButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(55, 55),
        shape: const CircleBorder(),
      ),
      onPressed: () {
        Navigator.pushNamed(context, favoritesRoute);
      },
      child: const Icon(Icons.favorite),
    );
  }

  startSearch(HomeViewModel vm, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: TextFormField(
        controller: controller,
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

  destinationSearch(HomeViewModel vm, TextEditingController start,
      TextEditingController dest) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        controller: dest,
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
            if (dest.text.isNotEmpty) {
              dest.clear();
              start.clear();
              Navigator.pushNamed(context, buslineinfoRoute);
            }
          });
        },
      ),
    );
  }

  busList(BuildContext context, HomeViewModel vm) {
    return Expanded(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView.builder(
            itemCount: vm.buses.length,
            itemBuilder: (context, index) {
              final favorited = vm.favorites.contains(vm.buses[index]);
              return ListTile(
                title: Text(
                  vm.buses[index],
                ),
                trailing: GestureDetector(
                  child: Icon(
                    favorited ? Icons.favorite : Icons.favorite_border,
                    color: favorited ? Colors.red : null,
                    semanticLabel: favorited ? 'Remove from saved' : 'Save',
                  ),
                  onTap: () {
                    setState(() {
                      if (favorited) {
                        vm.favorites.remove(vm.buses[index]);
                      } else {
                        vm.favorites.add(vm.buses[index]);
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
      ),
    );
  }
}
