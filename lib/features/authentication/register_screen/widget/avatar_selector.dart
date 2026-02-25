import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets_image/app_assets.dart';

class AvatarSelector extends StatefulWidget {
  const AvatarSelector({Key? key}) : super(key: key);

  @override
  State<AvatarSelector> createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {
  List<String> avatars = [
    AppAssets.person_one,
    AppAssets.person_tow,
    AppAssets.person_three,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        avatars.length,
            (index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            margin: REdgeInsets.symmetric(horizontal: 8),
            padding: REdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selectedIndex == index
                    ? Colors.orange
                    : Colors.transparent,
                width: 3.w,
              ),
            ),
            child: CircleAvatar(
              radius: index == selectedIndex ? 32 : 26,
              backgroundImage: AssetImage(avatars[index]),
            ),
          ),
        ),
      ),
    );
  }
}