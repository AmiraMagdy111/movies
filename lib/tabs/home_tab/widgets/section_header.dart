import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/theming/styles_manager.dart';
import '../../../core/assets_image/app_assets.dart';

class SectionHeader extends StatelessWidget {
  final String title;
   VoidCallback onPress;
      SectionHeader({super.key, required this.title,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: StylesManager.sectionTitle20regular,),
          Row(
            children: [
              Text("see more",style: StylesManager.sectionTitle16regular,),
               SizedBox(width: 1.w),
              IconButton(
                onPressed: onPress,
                icon: SvgPicture.asset(SvgIconHomeTab.arrow)
              ),
            ],
          )
        ],
      ),
    );
  }
}

