import 'package:flutter/material.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/features/tab_widget/brows_tab/browse_screen.dart';
import 'package:movies/tabs/main_layout.dart';
import '../../features/authentication/login/login_screen.dart';
import '../../features/authentication/register_screen/register_screen.dart';
import '../../features/movies_details/movies_details.dart';
import '../../features/onboarding_screen/onboarding_screen.dart';
import 'package:movies/features/authentication/reset_password/reset_password.dart';



import '../../tabs/home_tab/home_tab.dart';

class RoutingManager {
  RoutingManager();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
        case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case  Routes.browseScreen:
        return MaterialPageRoute(builder: (_) => const BrowseScreen());
      case  Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen());
      case Routes.homeTab:
        return MaterialPageRoute(
            builder: (_) => const  HomeTab());
      case Routes.mainLayout:
        return MaterialPageRoute(
            builder: (_) => const  MainLayout());

      case Routes.moviesDetails:
        return MaterialPageRoute(
            builder: (_) => const MoviesDetails());

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
