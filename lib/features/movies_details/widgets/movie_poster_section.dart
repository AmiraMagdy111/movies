import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets_image/app_assets.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'package:movies/core/theming/styles_manager.dart';
class MoviePosterSection extends StatelessWidget {
  final String image;
  final String title;
  final String year;

  const MoviePosterSection({super.key,required this.image,required this.title,required this.year
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 645.h,
      width: double.infinity,
      child: Stack(
        children: [
          Image.network(image,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF121312).withValues(alpha: 0.2),
                    const Color(0xFF121312),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                SvgIconHomeTab.play,
                width: 97.w,
                height: 97.h,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left, color: ColorsManager.white,size: 29,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.bookmark, color: ColorsManager.white,
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: REdgeInsets.only(left: 16,right:16,bottom:8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: StylesManager.text24bold,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height:15.h),
                    Text(
                     year,
                      style: StylesManager.movieYear20bold
                      ),
                  ],
                ),
              ),
            ),

        ],
      ),
    );
  }
}