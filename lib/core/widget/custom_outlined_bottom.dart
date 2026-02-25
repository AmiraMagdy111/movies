import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theming/colors_manager.dart';
import '../theming/onboarding_text/onboarding_text.dart';

class CustomOutlinedBottom extends StatelessWidget {
  final  VoidCallback onPressed;
  const CustomOutlinedBottom({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: OutlinedButton(
          onPressed: onPressed, child: Text(OnboardingTexts.back,
        style: GoogleFonts.inter(fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.primaryOrange),
      )),

    );
  }
}
