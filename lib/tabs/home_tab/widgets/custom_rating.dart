import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/styles_manager.dart';
class CustomRating extends StatelessWidget {
  final double rating;
  const CustomRating({super.key,required this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
              width: 58,
              height: 28,
              decoration: BoxDecoration(
                color: Color(0xB3000000),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(rating.toStringAsFixed(1),style: StylesManager.ratingText,),
                  Icon(Icons.star,color: ColorsManager.primaryOrange,),
                ],
              ),
            );
  }
}
