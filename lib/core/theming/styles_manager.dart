import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/font_weight_helper.dart';
import 'colors_manager.dart';
//
class StylesManager {

  static TextStyle googleFont20BlackRegular = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.textBlack,
  );
  static TextStyle googleFont14WhiteRegular = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
  );
  static TextStyle googleFont14OrangeBold = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primaryOrange,
  );
  static TextStyle googleFont14OrangeRegular = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primaryOrange,
  );

}