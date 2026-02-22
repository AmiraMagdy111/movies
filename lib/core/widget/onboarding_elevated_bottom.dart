import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/helpers/font_weight_helper.dart';
import 'package:movies/core/theming/colors_manager.dart';

class OnboardingElevatedBottom extends StatelessWidget {
  final String text;
 final  VoidCallback onPressed;
  const OnboardingElevatedBottom({super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(

      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.goldenYellow,
        foregroundColor: ColorsManager.black,
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.r)
        )
      ),
        onPressed: onPressed,
          child: Text(text,style: GoogleFonts.inter(fontSize: 20.sp,
          fontWeight: FontWeightHelper.semiBold,
          color: ColorsManager.black) ,),
      ),
    );
  }
}
