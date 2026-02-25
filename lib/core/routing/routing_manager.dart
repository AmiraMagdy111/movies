import 'package:flutter/material.dart';
import 'package:movies/core/routing/routes.dart';
import '../../features/authentication/login/login_screen.dart';
import '../../features/authentication/register_screen/register_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/onboarding_screen/on_boarding_screen.dart';
import 'package:movies/features/authentication/reset_password/reset_password.dart';

class RoutingManager {
  RoutingManager();

  Route generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case  Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 Not Found')),
          ),
        );
    }


    }
}
