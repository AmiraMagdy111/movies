import 'package:flutter/material.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/tabs/main_layout.dart';
import 'package:movies/features/profile/update_profile_ui.dart';

import '../../features/authentication/login/login_screen.dart';
import '../../features/authentication/register_screen/register_screen.dart';
import '../../features/movies_details/movies_details.dart';
import '../../features/onboarding_screen/onboarding_screen.dart';
import 'package:movies/features/authentication/reset_password/reset_password.dart';

import '../../tabs/home_tab/home_tab.dart';

import '../../features/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/profile/update_profile_cubit.dart';
class RoutingManager {
  RoutingManager();

  Route generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
         builder: (_) => BlocProvider( create: (context) => UpdateProfileCubit()..getUserData(),
        child: const HomeScreen(),
         ),
        );
        case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.updateprofile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UpdateProfileCubit()..getUserData(),
            child: const UpdateProfile(),
          ),
        );
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
      case Routes.updateprofile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UpdateProfileCubit()..getUserData(),
            child: const UpdateProfile(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 Not Found')),
          ),
        );
    }


    }
}
