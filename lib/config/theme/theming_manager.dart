import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/theming/styles_manager.dart';

import '../../core/helpers/font_weight_helper.dart';
import '../../core/theming/colors_manager.dart';

class ThemeManager{
  static final ThemeData light = ThemeData(

  );
  static final ThemeData dark = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.primaryBlack,
      centerTitle: true,

      iconTheme: const IconThemeData(
        color: ColorsManager.primaryOrange,
        size: 22,
      ),
      titleTextStyle:TextStyle( fontSize: 20,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.primaryOrange,),

      //foregroundColor: ColorsManager.primaryLight,
      //titleTextStyle: StylesManager.googleFont20LightMedium,
    ),
    //scaffoldBackgroundColor: ColorsManager.primaryDark,

  );
}