import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theming/styles_manager.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Widget child;
  final double space;
  const SectionTitle({super.key,
    required this.title,
    required this.space,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: StylesManager.text24bold,),
          SizedBox(height: space.h,),
          child
        ],
      ),
    );
  }
}
