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
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: viewModel.favorites.length,
            itemBuilder: (context, index) {
              final favorited = true;
              return ListTile(
                title: Text(
                  viewModel.favorites[index],
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
