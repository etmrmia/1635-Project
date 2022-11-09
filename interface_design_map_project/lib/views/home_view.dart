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
        title: Text("Bus App"),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.amberAccent,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      ),
                      onFieldSubmitted: (value) {
                        setState(() {
                          if (_destination.text.isNotEmpty) {
                            _destination.clear();
                            _starting.clear();
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Buses",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.builder(
                          itemCount: viewModel.buses.length,
                          itemBuilder: (context, index) {
                            final favorited = viewModel.favorites
                                .contains(viewModel.buses[index]);
                            return ListTile(
                              title: Text(
                                viewModel.buses[index],
                              ),
                              trailing: GestureDetector(
                                child: Icon(
                                  favorited
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: favorited ? Colors.red : null,
                                  semanticLabel:
                                      favorited ? 'Remove from saved' : 'Save',
                                ),
                                onTap: () {
                                  setState(() {
                                    if (favorited) {
                                      viewModel.favorites
                                          .remove(viewModel.buses[index]);
                                    } else {
                                      viewModel.favorites
                                          .add(viewModel.buses[index]);
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
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const FractionalOffset(.97, 0.01),
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, favoritesRoute);
                },
                child: const Icon(Icons.favorite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
