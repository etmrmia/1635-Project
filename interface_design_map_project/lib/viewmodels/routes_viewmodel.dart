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

    String get busImage{
      return route.busImage;
    }
  }