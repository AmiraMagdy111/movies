import 'package:flutter/material.dart';

import '../../../../core/assets_image/app_assets.dart';

class AvatarSelector extends StatefulWidget {
  const AvatarSelector({Key? key}) : super(key: key);

  @override
  State<AvatarSelector> createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {

  // صور من AppAssets
  List<String> avatars = [
    AppAssets.person_one,
    AppAssets.person_tow,
    AppAssets.person_three,
  ];

  int selectedIndex = 0; // الأفاتار المختار

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
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              // إطار عند الاختيار
              border: Border.all(
                color: selectedIndex == index
                    ? Colors.orange
                    : Colors.transparent,
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: index == selectedIndex ? 32 : 26,

              // صورة من assets
              backgroundImage: AssetImage(avatars[index]),
            ),
          ),
        ),
      ),
    );
  }
}