import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/font_weight_helper.dart';
import 'colors_manager.dart';
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
  static TextStyle hintTextStyle = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
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
      color: ColorsManager.primaryBlack
  );

  static TextStyle ratingText = GoogleFonts.roboto(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.white,
    decoration: TextDecoration.none
  );
  static TextStyle sectionTitle20regular = GoogleFonts.roboto(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.white,
      decoration: TextDecoration.none
  );
  static TextStyle sectionTitle16regular = GoogleFonts.roboto(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.primaryOrange,
      decoration: TextDecoration.none
  );
  static TextStyle text24bold = GoogleFonts.roboto(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.white,
      decoration: TextDecoration.none
  );
  static TextStyle movieYear20bold = GoogleFonts.roboto(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.grayDad,
      decoration: TextDecoration.none
  );


}