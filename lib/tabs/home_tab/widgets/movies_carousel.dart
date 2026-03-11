import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/api/models/Movies.dart';
import 'package:movies/tabs/home_tab/widgets/custom_rating.dart';
class MoviesCarousel extends StatelessWidget {
  final List<Movies> movies;
  final Function(int) onPageChanged;
  const MoviesCarousel({
    super.key,
    required this.movies,
    required this.onPageChanged,
  });
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: movies.map((movie) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  movie.mediumCoverImage ?? "",
                  fit: BoxFit.cover,
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
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 351.h,
        viewportFraction: 0.54,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          onPageChanged(index);
        },
      ),
    );
  }
}