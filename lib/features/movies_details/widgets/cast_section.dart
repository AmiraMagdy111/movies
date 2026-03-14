import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/api/models/movies_details_response/cast_model.dart';
import 'package:movies/features/movies_details/widgets/cast_item.dart';
import 'package:movies/features/movies_details/widgets/section_title.dart';

class CastSection extends StatelessWidget {
  final List<CastModel> cast;

  const CastSection({
    super.key,
    required this.cast,
  });

  @override
  Widget build(BuildContext context) {
    return SectionTitle(
      title: "Cast",
      space: 3.h,
      child: Column(
        children: cast.map((actor) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: CastItem(
              name: actor.name,
              character: actor.characterName,
              image: actor.imageUrl,
            ),
          );
        }).toList(),
      ),
    );
  }
}