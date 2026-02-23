import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theming/colors_manager.dart';

class ThemeManager{
  static final ThemeData light = ThemeData(

  );
  static final ThemeData dark = ThemeData(
    appBarTheme: AppBarTheme(
      //backgroundColor: ColorsManager.primaryDark,
      //foregroundColor: ColorsManager.primaryLight,
      //titleTextStyle: StylesManager.googleFont20LightMedium,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: ColorsManager.primaryBlack,

  );
}