
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/movies_details/widgets/section_title.dart';
import 'package:movies/tabs/home_tab/widgets/movie_card.dart';

import '../../../api/models/movies_response/Movies.dart';

class SimilarSection extends StatelessWidget {
  final List<Movies> movies;

  const SimilarSection({super.key,required this.movies});
  @override
  Widget build(BuildContext context) {
    return SectionTitle(title: "Similar" ,space: 11.h, child:
          GridView.builder(
            padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 mainAxisSpacing: 16,
                 crossAxisSpacing: 20,
                 childAspectRatio: 0.67,),
              itemCount: movies.length,
                  itemBuilder: (context, index) => MovieCard(
                    movie: movies[index],
                  )

              )

          );
  }
}
