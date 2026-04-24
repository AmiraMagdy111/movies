import 'package:flutter/material.dart';
import 'package:movies/core/routing/routes.dart';
import '../../features/authentication/login/login_screen.dart';
import '../../features/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/profile/update_profile_cubit.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/profile/wathchlist_cubit.dart';
import '../../services/api_service.dart';
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
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => UpdateProfileCubit()..getUserData()),
              BlocProvider(create: (context) => WatchlistCubit(ApiService())),
            ],
            child: const ProfileScreen(),
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
