import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../api/models/movies_response/Movies.dart';
import '../../../core/assets_image/app_assets.dart';
import 'custom_rating.dart';

class MovieCard extends StatelessWidget {
  final Movies? movie;
  final String? image;
  final double? rating;
  final VoidCallback? onTap;
  final double? width;

  const MovieCard({
    super.key,
    this.movie,
    this.image,
    this.rating,
    this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {

    final displayImage = image ?? movie?.mediumCoverImage;
    final displayRating = rating ?? movie?.rating ?? 0;

    final isValidImage = displayImage != null &&
        displayImage.isNotEmpty &&
        displayImage.startsWith('http');

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: isValidImage
                    ? NetworkImage(displayImage)
                    : const AssetImage(OnboardingImage.page1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 13,
            left: 14,
            child: CustomRating(
              rating: displayRating,
            ),
          ),
        ],
      ),
    );
  }
  }
