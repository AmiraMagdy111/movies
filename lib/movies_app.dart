import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:movies/Auth_checker.dart';
import 'package:movies/core/prefs_manager/prefs_manager.dart';
import 'package:movies/core/routing/routing_manager.dart';

import 'config/theme/theming_manager.dart';
import 'core/routing/routes.dart';

class MoviesApp extends StatelessWidget {
  final RoutingManager appRouter;
  const MoviesApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) =>
          MaterialApp(
            theme: ThemeManager.light,
            darkTheme: ThemeManager.dark,
            themeMode: ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            //home: AuthChecker(),
             initialRoute: PrefsManager.getOnboarding() == false
            ? Routes.onboardingScreen
              : Routes.loginScreen,
            onGenerateRoute: appRouter.generateRoute,
          ),
    );
  }
}