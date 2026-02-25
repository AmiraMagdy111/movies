import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theming/onboarding_text/onboarding_text.dart';
import 'package:movies/core/theming/styles_manager.dart';
import 'package:movies/core/widget/onboarding_elevated_bottom.dart';
import 'package:movies/model%20/onboarding_data_model%20/onboarding_data_model.dart';

class OnboardingWithSimple extends StatelessWidget {
  final OnboardingDataModel onboardingDataModel;
  final VoidCallback onNext;
  final int currentIndex;
  const OnboardingWithSimple({super.key,required this.onboardingDataModel,
  required this.onNext, required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 24,vertical: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(onboardingDataModel.title,textAlign: TextAlign.center,
            style: StylesManager.titleLarge36Medium,),
          SizedBox(height: 16.h,),
          if (onboardingDataModel.description != null)
            Text(
              onboardingDataModel.description!,
              textAlign: TextAlign.center,
              style: StylesManager.description20regular,
            ),
          SizedBox(height: 24.h,),
          OnboardingElevatedBottom(text: OnboardingTexts.exploreNow,onPressed:onNext,),
      ]),
    );

  }
}
