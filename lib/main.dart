import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/prefs_manager/prefs_manager.dart';
import 'package:movies/core/routing/routing_manager.dart';
import 'features/tab_widget/brows_tab/bloc/browse_bloc.dart';
import 'features/tab_widget/brows_tab/bloc/browse_event.dart';
import 'movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BrowseBloc()..add(LoadGenresEvent()),
        ),
      ],
      child: MoviesApp(appRouter: RoutingManager()),
    ),
  );
}



