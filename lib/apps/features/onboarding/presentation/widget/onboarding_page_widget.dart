import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/apps/features/onboarding/presentation/widget/onboarding_background.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:google_fonts/google_fonts.dart';

enum CirclePosition { left, right }

class OnboardingData {
  final String imagePath;
  final String title;
  final String description;
  final CirclePosition circlePosition;

  const OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
    this.circlePosition = CirclePosition.left,
  });
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingData data;
  final void Function()? callBack;
  final bool isLast;

  const OnboardingPageWidget({
    super.key,
    required this.data,
    required this.isLast,
    this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    final isLeft = data.circlePosition == CirclePosition.left;

    return Stack(
      children: [
        OnboardingBackground(isLeft: isLeft),
        Positioned(
          top: 111,
          left: 20,
          right: 20,
          bottom: 43,
          child: Column(
            children: [
              CircleAvatar(
                radius: 170,
                backgroundColor: AppColors.black,
                backgroundImage: AssetImage(data.imagePath),
              ),
              Spacer(flex: 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 49.w),
                child: Column(
                  children: [
                    Text(
                      data.title,
                      style: GoogleFonts.rubik(
                        textStyle: context.medium28Black,
                      ),
                    ),
                    Gap(2),
                    Text(
                      data.description,
                      style: GoogleFonts.rubik(
                        textStyle: context.medium14TextSub,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Spacer(flex: 3),
              CustomButtom(
                height: 54.h,
                width: 295.w,
                onTap: isLast
                    ? () => ChooseRoleRoute().push(context)
                    : callBack,
                text: isLast ? tr.onboarding.getStarted : tr.onboarding.next,
              ),
              Gap(12),
              InkWell(
                onTap: () => ChooseRoleRoute().push(context),
                child: Text(tr.onboarding.skip, style: context.medium14),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
