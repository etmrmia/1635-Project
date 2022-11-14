import 'package:flutter/material.dart';
import '../constants.dart';
import 'busline_view.dart';
import 'favorites_view.dart';
import 'home_view.dart';
import '../viewmodels/home_viewmodel.dart';
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
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Column(
        children: [
          busLineSearch(viewModel, _busLine),
          Expanded(child: favoritesList(context)),
        ],
      ),
    );
  }

  favoritesList(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, vm, _) {
        List<String> favorites = vm.favorites;
        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            // final favorited = true;
            return ListTile(
              title: Text(
                favorites[index],
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

  busLineSearch(HomeViewModel vm, TextEditingController line) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: TextFormField(
        controller: line,
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
            vm.addFavorite(value);
            line.clear();
            setState(() {});
          }
        },
      ),
    );
  }
}
