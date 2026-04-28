import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/prefs_manager/prefs_manager.dart';
import 'package:movies/core/routing/routing_manager.dart';
import 'package:movies/firebase_options.dart';
import 'package:movies/tabs/profile_tab/update_profile_cubit.dart';

import 'clean_architecture/domain/cubit/auth_cubit.dart';
import 'core/di/di.dart';
import 'features/tab_widget/brows_tab/bloc/browse_bloc.dart';
import 'features/tab_widget/brows_tab/bloc/browse_event.dart';
import 'movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Dependency Injection
  configureDependencies();

  // Shared Preferences
  await PrefsManager.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<UpdateProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => BrowseBloc()..add(LoadGenresEvent()),
        ),
      ],
      child: MoviesApp(
        appRouter: RoutingManager(),
      ),
    ),
  );
}