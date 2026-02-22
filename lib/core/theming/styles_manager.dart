import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/font_weight_helper.dart';
import 'colors_manager.dart';
class StylesManager {

  static TextStyle googleFont24LightMedium = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    //color: ColorsManager.primaryLight,
  );
  static TextStyle description20regular = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
      color: ColorsManager.white60
  );
  static TextStyle titleMedium24Bold = GoogleFonts.inter(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.white
  );
  static TextStyle titleLarge36Medium = GoogleFonts.inter(
      fontSize: 36.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.white,
    height: 1.2
  );
  static TextStyle text20 = GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsManager.black
  );


}
