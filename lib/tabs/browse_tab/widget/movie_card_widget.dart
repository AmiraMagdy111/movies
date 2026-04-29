import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'package:movies/tabs/home_tab/widgets/custom_rating.dart';

class MovieCardWidget extends StatelessWidget {
  final Map movie;
  final double? rating;
  final VoidCallback onTap;
  const MovieCardWidget({
    super.key, required this.movie, this.rating,required this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child:Stack(
                children: [
                  Image.network(
                    movie['medium_cover_image'] ?? '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return
                        Container(color: Colors.red,
                          child: const Icon(Icons.image_not_supported, color: Colors.white),
                        );
                    },
                  ),
                  Positioned(
                    top: 13,
                    left: 10,
                    child: CustomRating(
                      rating: (movie['rating'] ?? 0).toDouble(),
                    ),
                  ),
                ],
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
      ),
    );
  }
}