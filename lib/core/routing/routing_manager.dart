import 'package:flutter/material.dart';
import 'package:movies/core/routing/routes.dart';

import '../../features/authentication/login/login_screen.dart';
import '../../features/home/home_screen.dart';

class RoutingManager {
  RoutingManager();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 Not Found')),
          ),
        );
    }
  }
}
