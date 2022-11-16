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
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final _busLine = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<HomeViewModel>(context, listen: false);
  // }

  @override
  void dispose() {
    _busLine.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _favorites = context.watch<HomeViewModel>().myList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Column(
        children: [
          // Search for bus line
          busLineSearch(),
          // Display favorites list
          Expanded(child: favoritesList(_favorites)),
        ],
      ),
    );
  }

  // Display list of favorites method
  favoritesList(List<Bus> favorites) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        // final favorited = true;
        return ListTile(
          title: Text(
            favorites[index].title,
          ),
          onTap: () {
            Navigator.pushNamed(context, buslineinfoRoute);
          },
        );
      },
    );
    // return Consumer<HomeViewModel>(
    //   builder: (context, vm, _) {
    //     return ListView.builder(
    //       itemCount: vm.myList.length,
    //       itemBuilder: (context, index) {
    //         // final favorited = true;
    //         return ListTile(
    //           title: Text(
    //             vm.myList[index].title,
    //           ),
    //           onTap: () {
    //             Navigator.pushNamed(context, buslineinfoRoute);
    //           },
    //         );
    //       },
    //     );
    //   },
    // );
  }

  // Search by busline method
  busLineSearch() {
    List<Bus> listOfBuses = context.read<HomeViewModel>().buses;
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
                context.read<HomeViewModel>().addToList(listOfBuses[i]);
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
