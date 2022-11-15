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
    var bus = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Column(
        children: [
          // Search for bus line
          busLineSearch(viewModel),
          // Display favorites list
          Expanded(
            child: Consumer<HomeViewModel>(
              builder: (context, vm, child) => ListView.builder(
                itemCount: vm.myList.length,
                itemBuilder: (context, index) =>
                    FavoriteBusTile(vm.myList[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Display list of favorites method
  favoritesList(HomeViewModel vm) {
    // return ListView.builder(
    //   itemCount: vm.myList.length,
    //   itemBuilder: (context, index) => ListTile(
    //     title: Text(
    //       vm.myList[index].title,
    //     ),
    //   ),
    // );

    // return ListView.builder(
    //   itemCount: bus.myList.length,
    //   itemBuilder: (context, (context, index) => ListTile

    //   );
    // );

    // return Consumer<HomeViewModel>(
    //   builder: (context, vm, child) {
    //     final tiles = vm.myList.map(
    //       (pair) {
    //         return ListTile(
    //           title: Text(pair.title),
    //         );
    //       },
    //     );
    //     final divided = tiles.isNotEmpty
    //         ? ListTile.divideTiles(
    //             context: context,
    //             tiles: tiles,
    //           ).toList()
    //         : <Widget>[];

    //     return ListView(children: divided, key: UniqueKey());
    //   },
    // );

    // return Consumer<HomeViewModel>(
    //   builder: (context, value, child) => ListView.builder(
    //     itemCount: value.myList.length,
    //     itemBuilder: (context, index) => FavoriteBusTile(value.myList[index]),
    //     // final favorited = true;
    //     // return ListTile(
    //     //   title: Text(
    //     //     vm.myList[index].title,
    //     //   ),
    //     //   onTap: () {
    //     //     Navigator.pushNamed(context, buslineinfoRoute);
    //     //   },
    //     // );
    //     // },
    //   ),
    // );
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

class FavoriteBusTile extends StatelessWidget {
  final Bus bus;
  const FavoriteBusTile(this.bus);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(bus.title),
      trailing: IconButton(
        key: Key('remove_icon'),
        icon: Icon(Icons.close),
        onPressed: () {
          Provider.of<HomeViewModel>(context, listen: false)
              .removeFromList(bus);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Removed from favorites.'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
