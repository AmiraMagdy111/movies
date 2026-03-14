import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theming/styles_manager.dart';
import '../../../core/theming/colors_manager.dart';


class CastItem extends StatelessWidget {
  final String name;
  final String character;
  final String image;

  const CastItem({super.key,
    required this.name,
    required this.character,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398.w,
      decoration: BoxDecoration(
          color: ColorsManager.secondaryGrey,
          borderRadius: BorderRadius.circular(16.r)
      ), child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: image.isNotEmpty
              ? Image.network(
            image,
            width: 70.w,
            height: 70.h,
            fit: BoxFit.cover,
          )
              : Container(
            width: 70.w,
            height: 70.h,
            color: Colors.grey,
          ),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( "Name : $name",style: StylesManager.sectionTitle20regular),
              Text(
                "Character : $character",style: StylesManager.sectionTitle20regular,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    ),
    );
  }
}
