 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theming/styles_manager.dart';

import 'package:movies/features/movies_details/widgets/section_title.dart';

class SummarySection extends StatelessWidget {
  final String summary;
   const SummarySection({super.key,
   required this.summary});

   @override
   Widget build(BuildContext context) {
     return SectionTitle(title: "Summary", space: 8.h,
         child: Text(summary,style: StylesManager.googleFont14WhiteRegular,)
     );
   }
 }
