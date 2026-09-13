import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/features/onboarding/presentation/widget/onboarding_page_widget.dart';
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
      title: "Find Trusted Doctors",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
      circlePosition: CirclePosition.left,
    ),

    OnboardingData(
      imagePath: "${AppImages.onboarding}onboarding2.png",
      title: "Choose Best Doctors",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
      circlePosition: CirclePosition.right,
    ),
    OnboardingData(
      imagePath: "${AppImages.onboarding}onboarding3.png",
      title: "Easy Appointments",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
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
