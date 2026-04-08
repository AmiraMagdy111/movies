import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/theming/colors_manager.dart';
import '../../../core/helpers/font_weight_helper.dart';
class CustomFilledButton extends StatelessWidget {
  VoidCallback onPressed;
   CustomFilledButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: Size(double.infinity, 58.h),
        textStyle: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeightHelper.bold,
            decoration: TextDecoration.none),
        backgroundColor: ColorsManager.red,
        foregroundColor:  ColorsManager.white,
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(15.r)
        )
      ),
        onPressed: onPressed, child: Text("Watch",));
  }
}