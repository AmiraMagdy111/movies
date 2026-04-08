import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/movies_details/widgets/section_title.dart';

import '../genre_item.dart';

class GenresSection extends StatelessWidget {
  final List<String> genres;
  const GenresSection({super.key,required this.genres});

  @override
  Widget build(BuildContext context) {
    return SectionTitle(
      title: "Genres",
      space: 3.h,
      child: Wrap(
        spacing: 16.w,
        runSpacing: 11.h,
        children: genres.map((genre) {
          return GenreItem(text: genre);
        }).toList(),
      ),
    );
  }
}
