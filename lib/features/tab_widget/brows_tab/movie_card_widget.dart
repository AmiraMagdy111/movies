import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theming/colors_manager.dart';

class MovieCardWidget extends StatelessWidget {
  final Map movie;

  const MovieCardWidget({
    super.key,
    required this.movie,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child:
            Image.network(
              movie['medium_cover_image'] ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey,
                  child: const Icon(Icons.image_not_supported, color: Colors.white),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          movie['title'] ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:TextStyle(color: ColorsManager.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
       ),
      ],
    );
  }
}