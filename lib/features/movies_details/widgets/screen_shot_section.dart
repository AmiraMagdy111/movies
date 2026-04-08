import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/movies_details/widgets/section_title.dart';
class ScreenShotSection extends StatelessWidget {
  final List<String> images;
  const ScreenShotSection({
    super.key,
    required this.images,
  });
  @override
  Widget build(BuildContext context) {
    return SectionTitle(
      title: "ScreenShots",
      space: 9.h,
      child: Column(
        children: images.map((image) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                image,
                height: 165.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}