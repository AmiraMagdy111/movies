import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/helpers/font_weight_helper.dart';
import 'package:movies/core/theming/colors_manager.dart';

class MovieInfoItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color? color;
  final VoidCallback? onPressed;

  const MovieInfoItem({super.key,required this.text,
    this.onPressed,
    required this.icon,
    this.color
  });

  @override
  State<MovieInfoItem> createState() => _MovieInfoItemState();
}

class _MovieInfoItemState extends State<MovieInfoItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      height: 47.h,
      decoration: BoxDecoration(
        color: ColorsManager.secondaryGrey,
        borderRadius: BorderRadius.circular( 16.r),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(widget.icon, color: widget.color,
              ),
              onPressed: widget.onPressed,
            ),
            Text(widget.text,style: GoogleFonts.roboto(
                fontSize: 24.sp,fontWeight: FontWeightHelper.bold,
                color: ColorsManager.white,decoration:TextDecoration.none
            ),
              textAlign: TextAlign.center,
            ),
          ]
      ),
    );
  }
}
