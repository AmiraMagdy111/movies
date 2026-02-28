import 'package:flutter/material.dart';
import 'package:movies/core/widget/onboarding_with_container/onboarding_with_container.dart';
import 'package:movies/core/widget/onboarding_with_simple/onboarding_with_simple.dart';
import 'package:movies/model%20/onboarding_data_model%20/onboarding_data_model.dart';



class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.onboardingDataModel,
    required this.onNext,
    required this.onBack,
    required this.currentIndex
  });
  final VoidCallback onNext;
  final VoidCallback onBack;
  final int currentIndex;

  final  OnboardingDataModel onboardingDataModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            onboardingDataModel.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: onboardingDataModel.gradient,
            ),
          ),
        ),
            onboardingDataModel.type == OnBoardingType.simple
              ? OnboardingWithSimple(onboardingDataModel: onboardingDataModel,
              onNext: onNext,
              currentIndex: currentIndex,
            )
              : OnboardingWithContainer(onboardingDataModel: onboardingDataModel,
              onNext: onNext,
              onBack: onBack,
              currentIndex: currentIndex,
            )
      ],
    );
  }
}