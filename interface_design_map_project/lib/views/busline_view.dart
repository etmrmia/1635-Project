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
        title: Text("buslines"),
      ),
    );
  }
}
