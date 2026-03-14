import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/helpers/font_weight_helper.dart';
import 'package:movies/core/theming/colors_manager.dart';

class MovieInfoItem extends StatelessWidget {
   final String text;
  final IconData icon ;
  const MovieInfoItem({super.key,required this.text,required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 47.h,
      decoration: BoxDecoration(
        color: ColorsManager.secondaryGrey,
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,color: ColorsManager.secondaryOrange,),
            SizedBox(width: 14.w,),
            Text(text,style: GoogleFonts.roboto(
              fontSize: 24.sp,fontWeight: FontWeightHelper.bold,
              color: ColorsManager.white,decoration:TextDecoration.none
            ),)
          ]
      ),
    );
  }
}
