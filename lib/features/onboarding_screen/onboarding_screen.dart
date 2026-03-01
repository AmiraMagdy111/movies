import 'package:flutter/material.dart';
import '../../core/prefs_manager/prefs_manager.dart';
import '../../core/routing/routes.dart';
import '../../core/widget/onboarding_page/onboarding_page.dart';
import '../../model/onboarding_model/onboarding_model.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen ({super.key});
  @override
  State<OnboardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnboardingScreen> {

  PageController pageController = PageController();
  int currentIndex = 0;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller:pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: OnboardingModel.onboardingList.length,
            itemBuilder: (context, index) =>
                OnboardingPage(
                  onboardingDataModel:OnboardingModel
                      .onboardingList[index],
                  onNext: _onNext,
                  onBack: _onBack,
                  currentIndex: currentIndex,
                )),
      );
    }
  void _onNext() async {
    int lastIndex = OnboardingModel.onboardingList.length - 1;
    if (currentIndex < lastIndex) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      await PrefsManager.saveOnboarding();
      Navigator.pushReplacementNamed(
        context,Routes.loginScreen,
      );
    }
  }
  void _onBack() {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  }



