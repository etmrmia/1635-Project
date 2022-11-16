import 'package:flutter/material.dart';
import '../constants.dart';
import 'busline_view.dart';
import 'favorites_view.dart';
import 'home_view.dart';
import '../viewmodels/home_viewmodel.dart';
import '../models/bus.dart';
import '../router.dart';
import 'package:provider/provider.dart';

// class FavoritesView extends StatelessWidget {
// final List<Bus> favorites;
// const FavoritesView({super.key, required this.favorites});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Favorites"),
//       ),
//       body: Column(
//         children: [

// Expanded(
//   child: ListView.builder(
//     itemCount: favorites.length,
//     itemBuilder: (context, index) {
//       // final favorited = true;
//       return ListTile(
//         title: Text(
//           favorites[index].title,
//         ),
//         onTap: () {
//           pushBusInfo(favorites[index], context);
//         },
//       );
//     },
//   ),
//           ),
//         ],
//       ),
//     );
//   }

//   pushBusInfo(Bus line, BuildContext context) {
//     return Navigator.of(context).push(
//         MaterialPageRoute<void>(builder: (context) => BusLineView(line: line)));
//   }
// }

// class BusLineSearch extends StatefulWidget {
//   const BusLineSearch({super.key});

//   @override
//   State<BusLineSearch> createState() => _BusLineSearchState();
// }

// class _BusLineSearchState extends State<BusLineSearch> {
//   final _busLine = TextEditingController();

//   @override
//   void dispose() {
//     _busLine.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final vm = Provider.of<HomeViewModel>(context);
//     List<Bus> buses = context.watch<HomeViewModel>().buses;

//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//       child: TextFormField(
//         controller: _busLine,
//         decoration: const InputDecoration(
//           labelText: "Bus Line",
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.grey,
//               width: 1,
//             ),
//           ),
//           contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         ),
//         onFieldSubmitted: (value) {
//           if (value.isNotEmpty) {
//             for (int i = 0; i < buses.length; i++) {
//               if (buses[i].title == value) {
//                 context.read<HomeViewModel>().addToList(buses[i]);
//               }
//             }
//             _busLine.clear();
//             setState(() {});
//           }
//         },
//       ),
//     );
//   }
// }

class FavoritesView extends StatefulWidget {
  final List<Bus> favorites;
  const FavoritesView({super.key, required this.favorites});

  @override
  State<FavoritesView> createState() =>
      _FavoritesViewState(favorites: favorites);
}

class _FavoritesViewState extends State<FavoritesView> {
  final _busLine = TextEditingController();
  final List<Bus> favorites;
  _FavoritesViewState({required this.favorites});

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

          // Display favorites list
          Expanded(child: favoritesList(favorites)),
        ],
      ),
    );
  }

  // Display list of favorites method
  favoritesList(favorites) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        // final favorited = true;
        return ListTile(
          title: Text(
            favorites[index].title,
          ),
          onTap: () {
            pushBusInfo(favorites[index]);
          },
        );
      },
    );
  }

  pushBusInfo(Bus line) {
    return Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (context) => BusLineView(line: line)));
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
