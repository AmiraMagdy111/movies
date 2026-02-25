import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helpers/font_weight_helper.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'package:movies/core/theming/styles_manager.dart';
class ThemeManager {
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
textTheme: TextTheme(
  headlineSmall: StylesManager.description20regular,
  headlineMedium: StylesManager.titleMedium24Bold,
  headlineLarge: StylesManager.titleLarge36Medium,
  titleSmall: StylesManager.text20
),
outlinedButtonTheme: OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: ColorsManager.primaryOrange,
    side: BorderSide(
      color: ColorsManager.primaryOrange,
      width: 2.w,
    ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
  ),
),
  );
}