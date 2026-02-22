import 'package:flutter/material.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'package:movies/core/theming/onboarding_image/onboarding_image.dart';
import 'package:movies/core/theming/onboarding_text/onboarding_text.dart';

class OnboardingDataModel {
  final String image;
  final String title;
  final String ?description;
  final LinearGradient gradient;
  final OnBoardingType type;
  final double titleSpacing;
  final double? descriptionSpacing;
  final double ? buttonSpacing;

  OnboardingDataModel({
    required this.image,
    required this.title,
    this.description,
    required this.gradient,
    required this.type,
    required this.titleSpacing,
    this.descriptionSpacing,
    this.buttonSpacing

  });

  static final List<OnboardingDataModel> onboardingList = [
    OnboardingDataModel(image: OnboardingImage.page1,
        title: OnboardingTexts.titleBadge1,
        description: OnboardingTexts.descriptionBadge1,
        gradient: buildGradient(
          colors: [
            GradientColor.blackTransparent,
            GradientColor.black50,
            GradientColor.black90,
            GradientColor.blackFull
          ],
          stops: const [0.0, 0.5, 0.91, 1.0],
        ),
         titleSpacing: 16,
         descriptionSpacing: 24 ,
         type: OnBoardingType.simple),
    OnboardingDataModel(image: OnboardingImage.page2,
        title: OnboardingTexts.titleBadge2,
        description: OnboardingTexts.descriptionBadge2,
        gradient:buildGradient(
          colors: [
             GradientColor.petrolBlueTransparent,
             GradientColor.petrolBlue],
          stops: [0.0, 1.0],
        ),
        titleSpacing: 24,
        descriptionSpacing: 24,
        type: OnBoardingType.withContainer),
    OnboardingDataModel(image: OnboardingImage.page3,
        title: OnboardingTexts.titleBadge3,
        description: OnboardingTexts.descriptionBadge3,
        gradient: buildGradient(
          colors: [
             GradientColor.deepRedTransparent,
             GradientColor.deepRed,
          ],
          stops: [0.0, 1.0],
        ),
        titleSpacing: 8,
        descriptionSpacing: 16,
        buttonSpacing: 16,
        type: OnBoardingType.withContainer),
    OnboardingDataModel(image: OnboardingImage.page4,
        title: OnboardingTexts.titleBadge4,
        description: OnboardingTexts.descriptionBadge4,
        gradient: buildGradient(
          colors: [
             GradientColor.deepPurpleTransparent,
             GradientColor.deepPurple
          ],
          stops: [0.0, 1.0],
        ),
        titleSpacing: 8,
        descriptionSpacing: 16,
        buttonSpacing: 16,
        type: OnBoardingType.withContainer),

    OnboardingDataModel(image: OnboardingImage.page5,
        title: OnboardingTexts.titleBadge5,
        description: OnboardingTexts.descriptionBadge5,
        gradient: buildGradient(
          colors: [
            GradientColor.darkBurgundyTransparent,
            GradientColor.darkBurgundy,
          ],
          stops: [0.0, 1.0],
        ),
        titleSpacing: 17,
        descriptionSpacing: 27,
        buttonSpacing: 14,
        type: OnBoardingType.withContainer),
    OnboardingDataModel(
        image: OnboardingImage.page6, title: OnboardingTexts.watchingNow,
        gradient:buildGradient(
          colors: [
            GradientColor.charcoalTransparent,
            GradientColor.charcoal
          ],
          stops: [0.0, 1.0],
        ),
        titleSpacing: 27,
        buttonSpacing: 14,
        type: OnBoardingType.withContainer),
  ];
  static LinearGradient buildGradient({
    required List<Color> colors,
    required List<double> stops,
  }) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors,
      stops: stops,
    );
  }
}
enum OnBoardingType {
  simple,
  withContainer,
}



