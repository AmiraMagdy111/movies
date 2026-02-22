import 'package:flutter/material.dart';
import 'package:movies/model%20/onboarding_data_model%20/onboarding_data_model.dart';
import '../../core/routing/routes.dart';
import '../../core/widget/onboarding_page/onboarding_page.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

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
            itemCount: OnboardingDataModel.onboardingList.length,
            itemBuilder: (context, index) =>
                OnboardingPage(
                  onboardingDataModel: OnboardingDataModel
                      .onboardingList[index],
                  onNext: _onNext,
                  onBack: _onBack,
                  currentIndex: currentIndex,
                )),
      );
    }
  void _onNext() {
    int lastIndex = OnboardingDataModel.onboardingList.length - 1;
    if (currentIndex < lastIndex) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        Routes.homeScreen,
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



