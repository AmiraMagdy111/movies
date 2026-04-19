import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/prefs_manager/prefs_manager.dart';
import 'package:movies/core/routing/routing_manager.dart';

import 'package:movies/firebase_options.dart';
import 'package:movies/tabs/profile_tab/update_profile_cubit.dart';
import 'clean_architecture/domain/cubit/auth_cubit.dart';
import 'core/di/di.dart';
import 'movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies();

  await PrefsManager.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthCubit>(),
        ),
        BlocProvider(create: (_) => getIt<UpdateProfileCubit>()),
        // BlocProvider(
        //   create: (_) => getIt<UpdateProfileCubit>(),
      ],
      child: MoviesApp(
        appRouter: RoutingManager(),
      ),
    ),
  );
}
// void main() async {
//   configureDependencies();
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform
//   );
//   await PrefsManager.init();
//   runApp BlocProvider(
//       // providers: [
//       //   RepositoryProvider<AuthRepository>(
//           create: (_) => getIt<AuthCubit>()
//       //       firestoreRemoteDataSource: FirebaseFirestoreRemoteDataSource(),
//       //       remoteDataSource: AuthFirebaseRemoteDataSource(),
//       //       localDataSource: AuthSharedPrefsLocalDataSource(),
//       //     ),
//       //   ),
//       // ],
//       child: MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (context) => AuthCubit(
//                 authRepository: context.read<AuthRepository>(),
//               ),
//             ),
//           ],
//           child:
//           MoviesApp(appRouter: RoutingManager()))));
// }
