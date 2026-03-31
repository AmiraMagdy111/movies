import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/prefs_manager/prefs_manager.dart';
import 'package:movies/core/routing/routing_manager.dart';
import 'package:movies/features/authentication/cubit/auth_cubit.dart';
import 'package:movies/features/authentication/data_source/remote/auth_firebase_remote_data_source.dart';
import 'package:movies/features/authentication/repositry/auth_repository_implementation.dart';
import 'package:movies/firebase_options.dart';
import 'movies_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await PrefsManager.init();
  runApp(BlocProvider(
      create: (context) => AuthCubit(authRepository:
        AuthRepositoryImplementation(
          remoteDataSource:
          AuthFirebaseRemoteDataSource(),
        ),
      ),
      child: MoviesApp(appRouter: RoutingManager())));
}
