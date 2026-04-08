import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../api/models/movies_response/Movies.dart';
import '../../../core/theming/onboarding_image/onboarding_image.dart';
import 'custom_rating.dart';

class MovieCard extends StatelessWidget {
  final Movies ?movie;
  final VoidCallback? onTap;
  final double? width;
  final String ?image;
  final double? rating;

  const MovieCard({super.key,this.movie,
    this.onTap,this.width , this.image,this.rating
  });

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
       onTap: onTap,
       // onTap: (){
       //   Navigator.pushNamed(context,Routes.moviesDetails);
       child: Stack(
        children: [
          Container(
             width: width,
            // 146.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: movie?.mediumCoverImage != null
                    ? NetworkImage(movie!.mediumCoverImage!)
                    : AssetImage(OnboardingImage.page5) as ImageProvider,
                // image: NetworkImage(movie?.mediumCoverImage ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 13,
            left: 14,
            child: CustomRating(
              rating: movie?.rating ?? 0,
            ),
          ),
       ]),
     );
  }
}
