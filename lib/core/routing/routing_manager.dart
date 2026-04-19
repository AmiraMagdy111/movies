import 'package:flutter/material.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/tabs/main_layout.dart';
import 'package:movies/tabs/profile_tab/update_profile_ui.dart';
import '../../clean_architecture/domain/repository/auth_repository.dart';
import '../../features/authentication/login/login_screen.dart';
import '../../features/authentication/register_screen/register_screen.dart';
import '../../features/movies_details/movies_details.dart';
import '../../features/onboarding_screen/onboarding_screen.dart';
import 'package:movies/features/authentication/reset_password/reset_password.dart';
import '../../tabs/home_tab/home_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tabs/profile_tab/update_profile_cubit.dart';

class RoutingManager {
  RoutingManager();
  Route generateRoute(RouteSettings settings) {

     switch (settings.name) {
    //   case Routes.homeScreen:
    //     return MaterialPageRoute(
    //      builder: (_) => BlocProvider( create: (context) => UpdateProfileCubit()..getUserData(),
    //     child: const HomeScreen(),
    //      ),
    //     );
       case Routes.onboardingScreen:
         return MaterialPageRoute(
             builder: (_) => const OnboardingScreen());

      case  Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

        case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

       case Routes.resetPassword:
         return MaterialPageRoute(builder: (_) => const ResetPassword());

     case Routes.updateProfile:
     return MaterialPageRoute(
     builder: (_) => const UpdateProfile(),
     // case Routes.updateProfile:
     // return MaterialPageRoute(
     // builder: (_) => BlocProvider(
     // create: (context) => UpdateProfileCubit(
     // context.read<AuthRepository>(),
     // )..getUserData(),
     // child: const UpdateProfile(),
     //),
     );
      // case Routes.updateProfile:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => UpdateProfileCubit(
      //
      //       )..getUserData(),
      //       child: const UpdateProfile(),
      //     ),

       //
       // case Routes.profile:
       //   return MaterialPageRoute(
       //     builder: (_) => BlocProvider(
       //       create: (_) => UpdateProfileCubit()..getUserData(),
       //       child: const ProfileScreen(),
       //     ),

       case Routes.mainLayout:
         return MaterialPageRoute(
             builder: (_) => const MainLayout());

      case Routes.homeTab:
        return MaterialPageRoute(
            builder: (_) => const  HomeTab());

      case Routes.moviesDetails:
        return MaterialPageRoute(
            builder: (_) => MoviesDetails(movieId:settings.arguments as int,));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 Not Found')),
          ),
        );
    }


    }
}
