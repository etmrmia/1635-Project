import 'package:flutter/material.dart';
import '../constants.dart';
import 'busline_view.dart';
import 'favorites_view.dart';
import 'home_view.dart';
import '../viewmodels/home_viewmodel.dart';
import '../models/bus.dart';
import '../router.dart';
import 'package:provider/provider.dart';

class FavoritesView extends StatefulWidget {
  FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final _busLine = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  void dispose() {
    _busLine.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Column(
        children: [
          // Search for bus line
          busLineSearch(viewModel),
          Container(
            child: Center(
              child: Consumer<HomeViewModel>(
                builder: (context, value, child) => Text(
                  '${value.myList.length}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            // child: const Image(
            //   image: AssetImage('assets/images/CCAC.png'),
            // ),
          ),
          // Display favorites list
          Expanded(child: favoritesList()),
        ],
      ),
    );
  }

  // Display list of favorites method
  favoritesList() {
    return Consumer<HomeViewModel>(
      builder: (context, vm, _) {
        return ListView.builder(
          itemCount: vm.myList.length,
          itemBuilder: (context, index) {
            // final favorited = true;
            return ListTile(
              title: Text(
                vm.myList[index].title,
              ),
              onTap: () {
                //Navigator.pushNamed(context, buslineinfoRoute);
                print("Favorites List");
                for (int i = 0; i < vm.myList.length; i++) {
                  print(vm.myList[i].title);
                }
              },
            );
          },
        );
      },
    );
  }

  // Search by busline method
  busLineSearch(HomeViewModel vm) {
    List<Bus> listOfBuses = vm.buses;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: TextFormField(
        controller: _busLine,
        decoration: const InputDecoration(
          labelText: "Bus Line",
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
        onFieldSubmitted: (value) {
          if (value.isNotEmpty) {
            for (int i = 0; i < listOfBuses.length; i++) {
              if (listOfBuses[i].title == value) {
                vm.addToList(listOfBuses[i]);
              }
            }
            _busLine.clear();
            setState(() {});
          }
        },
      ),
    );
  }
}

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, vm, _) {
        return ListView.builder(
          itemCount: vm.myList.length,
          itemBuilder: (context, index) {
            // final favorited = true;
            return ListTile(
              title: Text(
                vm.myList[index].title,
              ),
              onTap: () {
                Navigator.pushNamed(context, buslineinfoRoute);
              },
            );
          },
        );
      },
    );
  }
}
