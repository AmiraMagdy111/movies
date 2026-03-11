import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/api/models/Movies.dart';
import 'custom_rating.dart';

class MovieCardListView extends StatelessWidget {
  final Movies movie;
  const MovieCardListView({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
     return Stack(
      children: [

        Container(
          width: 146.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: DecorationImage(
              image: NetworkImage(movie.mediumCoverImage ?? ""),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          top: 13,
          left: 14,
          child: CustomRating(
            rating: movie.rating ?? 0,
          ),
        ),
      ],
    );
  }
}
