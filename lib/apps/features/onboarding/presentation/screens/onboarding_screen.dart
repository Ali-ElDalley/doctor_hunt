import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/features/onboarding/presentation/widget/onboarding_page_widget.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  void _goToNextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  late List<OnboardingData> onboardingData = [
    OnboardingData(
      imagePath: "${AppImages.onboarding}onboarding1.png",
      title: tr.onboarding.onboarding1.title,
      description: tr.onboarding.onboarding1.sub,
      circlePosition: CirclePosition.left,
    ),

    OnboardingData(
      imagePath: "${AppImages.onboarding}onboarding2.png",
       title: tr.onboarding.onboarding2.title,
      description: tr.onboarding.onboarding2.sub,
      circlePosition: CirclePosition.right,
    ),
    OnboardingData(
      imagePath: "${AppImages.onboarding}onboarding3.png",
       title: tr.onboarding.onboarding3.title,
      description: tr.onboarding.onboarding3.sub,
      circlePosition: CirclePosition.left,
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return OnboardingPageWidget(
            data: onboardingData[index],
            isLast: index == onboardingData.length - 1,
            callBack: _goToNextPage,
          );
        },
      ),
    );
  }
}
