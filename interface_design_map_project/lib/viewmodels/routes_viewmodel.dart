import 'package:interface_design_map_project/models/routes.dart';
//import 'package:interface_design_map_project/viewmodels/home_viewmodel.dart';

class RoutesViewModel{
  final Routes route;

  RoutesViewModel({required this.route});
    
    String get source{
      return route.source;
    }

    String get currentStop{
      return route.currentStop;
    }

    String get destination{
      return route.destination;
    } 
   
   //if (route.source=="University of Pittsburgh" && route.destination=="Kennywood"){

    // route.busStops.add("Fifth Ave + Wood St");
    // route.busStops.add("Fifth Ave + Smithfield St");
    // Duquesne Blvd + Center
    // 5th Ave + #1681
    // Lysle Blvd + 5th 
    // Lysle Blvd + Evans
    // Lysle Blvd + Center
    // route.busStops.add("Lysle Blvd + Coursin");
    // route.busStops.add("Mckspt Transportation Ctr + Bay #2");
    //print(route.busStops);
   
   
    // String get source {
    //   return;
    // }
    //  String set route {
    //   return;
    // }

    // String get currentStop{
    //   return this.route.current_stop;
    // }


   
  }