import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/clean_architecture/data_source/remote/firebase_firestore_remote_data_source.dart';
import 'package:movies/core/prefs_manager/prefs_manager.dart';
import 'package:movies/core/routing/routing_manager.dart';

import 'package:movies/firebase_options.dart';
import 'clean_architecture/data_source/remote/auth_firebase_remote_data_source.dart';
import 'clean_architecture/domain/cubit/auth_cubit.dart';
import 'clean_architecture/domain/repository/auth_repository.dart';
import 'clean_architecture/domain/repository/auth_repository_implementation.dart';
import 'movies_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await PrefsManager.init();
  runApp (MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepositoryImplementation(
            firestoreRemoteDataSource: FirebaseFirestoreRemoteDataSource(),
            remoteDataSource: AuthFirebaseRemoteDataSource(),
          ),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
          ],

          child:
          MoviesApp(appRouter: RoutingManager()))));
}
