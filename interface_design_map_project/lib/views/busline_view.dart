import 'package:flutter/material.dart';
import '../constants.dart';
import 'busline_view.dart';
import 'favorites_view.dart';
import 'home_view.dart';
import '../viewmodels/home_viewmodel.dart';
import '../router.dart';
import 'package:provider/provider.dart';

class BusLineView extends StatefulWidget {
  const BusLineView({super.key});

  @override
  State<BusLineView> createState() => _BusLineViewState();
}

class _BusLineViewState extends State<BusLineView> {
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
        title: const Text("buslines"),
      ),
      body: Stack(
        children: [
          map(viewModel),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 5,
            alignment: Alignment.topCenter,
            child: alertsBox(viewModel),
          ),
        ],
      ),
    );
  }

  map(HomeViewModel vm) {
    return Container(
      color: Colors.amberAccent,
    );
  }

  alertsBox(HomeViewModel vm) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: const Text("Alerts"),
    );
  }
}
