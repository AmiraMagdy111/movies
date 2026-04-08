import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/movies_details/widgets/custom_filled_button.dart';
import 'package:movies/features/movies_details/widgets/movie_poster_section.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../api/models/movies_response/Movies.dart';
import 'movie_info_item.dart';
class MovieHeaderSection extends StatelessWidget {
  final String? ytTrailerCode;
  final Movies movie;
  const MovieHeaderSection({super.key,required this.movie,required this.ytTrailerCode,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoviePosterSection(
          image: movie.largeCoverImage ??"",
          title: movie.title ?? "",
          year: movie.year.toString(),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal:16.w),
          child: CustomFilledButton(
            onPressed: () {
              if (ytTrailerCode != null && ytTrailerCode!.isNotEmpty) {
                final url = "https://www.youtube.com/watch?v=$ytTrailerCode";

                launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.inAppWebView,
                );
              }
            },
          ),
        ),
        SizedBox(height:16.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w),
          child: Row(
            children: [
              Expanded(
                child: MovieInfoItem(
                  icon: Icons.favorite,
                  text: movie.likeCount?.toString() ?? "0",
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child:  MovieInfoItem(
                  icon: Icons.access_time,
                  text: movie.runtime?.toString() ?? "",
                ),
              ),
              SizedBox(width:16.w),
              Expanded(
                child: MovieInfoItem(
                  icon: Icons.star,
                  text: movie.rating?.toString() ?? "",
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}