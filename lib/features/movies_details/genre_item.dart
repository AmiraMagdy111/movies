import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'package:movies/core/theming/styles_manager.dart';

class GenreItem extends StatelessWidget {
  final String text;
  const GenreItem({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.w,
      height: 36.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorsManager.secondaryGrey,
      ),
        child: Center(
          child: Text(text,style: StylesManager.sectionTitle20regular.copyWith(fontSize: 16.sp)),
        ),
    );
  }
}
