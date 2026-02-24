import 'package:flutter/material.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/features/auth/register_screen/register_screen.dart';

import '../../features/home/home_screen.dart';

class RoutingManager {
  RoutingManager();

  Route generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case  Routes.registerScreen:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 Not Found')),
          ),
        );
    }


    }
}
