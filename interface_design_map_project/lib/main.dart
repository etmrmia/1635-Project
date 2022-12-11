import 'package:flutter/material.dart';
import 'package:interface_design_map_project/viewmodels/home_viewmodel.dart';
import 'views/home_view.dart';
import 'package:provider/provider.dart';

import 'router.dart' as LocalRouter;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Map App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: HomeView(),
      ),
      onGenerateRoute: LocalRouter.Router.generateRoute,
    );
  }
}
