import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'package:movies/core/theming/onboarding_text/onboarding_text.dart';
import 'package:movies/core/widget/custom_container.dart';
import '../../../model /onboarding_data_model /onboarding_data_model.dart';
import '../../helpers/font_weight_helper.dart';
import '../../theming/styles_manager.dart';
import '../onboarding_elevated_bottom.dart';
import '../custom_outlined_bottom.dart';
class OnboardingWithContainer extends StatelessWidget {
  const OnboardingWithContainer({super.key, required this.onboardingDataModel,
    required this.onBack,
    required this.onNext,
    required this.currentIndex
  });

  final OnboardingDataModel onboardingDataModel;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomContainer(
        title: onboardingDataModel.title,
        titleSpacing: onboardingDataModel.titleSpacing,
        description: onboardingDataModel.description,
        titleStyle: StylesManager.titleMedium24Bold,
        descriptionStyle: descriptionTextStyle(),
        descriptionSpacing: onboardingDataModel.descriptionSpacing,
        spacing: onboardingDataModel.buttonSpacing,
        elevatedButton: OnboardingElevatedBottom(text: currentIndex == OnboardingDataModel.onboardingList.length - 1
            ? OnboardingTexts.finish
            : OnboardingTexts.next,
          onPressed: onNext,
        ),

        outlinedButton: currentIndex > 1
            ? CustomOutlinedBottom(onPressed: onBack)
            : null,
      ),
    );
  }

  TextStyle descriptionTextStyle() {
    return GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.white
    );
  }
}
