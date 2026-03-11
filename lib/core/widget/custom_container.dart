import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors_manager.dart';
class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,required this.title,
    this.description,
    this.elevatedButton,this.outlinedButton,
    this.titleStyle,
    this.descriptionStyle,
    this.spacing,
    this.titleSpacing,
    this.descriptionSpacing
  });
  final String title;
  final String ?description;
  final Widget? elevatedButton;
  final Widget? outlinedButton;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final double? spacing;
  final double? titleSpacing;
  final double?descriptionSpacing;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.primaryBlack,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: Padding(
        padding: REdgeInsets.only(left: 16,right: 16,top: 16,bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            SizedBox(height: (titleSpacing ?? 0).h),
          if (description != null)
        Text(description!, style: descriptionStyle,
        textAlign: TextAlign.center,),
            SizedBox(height: (descriptionSpacing ?? 0).h),
            ?elevatedButton,
            SizedBox(height: (spacing ?? 0).h),
            ?outlinedButton,
          ],
        ),
      ),
    );
  }
}
