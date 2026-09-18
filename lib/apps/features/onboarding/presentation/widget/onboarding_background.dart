import 'dart:ui';

import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingBackground extends StatelessWidget {
  final bool isLeft;
  const OnboardingBackground({super.key, required this.isLeft});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -25,
          left: isLeft ? -120 : null,
          right: isLeft ? null : -120,
          child: Container(
            width: 342.w,
            height: 342.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryDark, AppColors.primaryLight],
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          right: -45,
          bottom: -45,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            child: CircleAvatar(
              radius: 108,
              backgroundColor: AppColors.primary.withValues(alpha: 0.3),
            ),
          ),
        ),
      ],
    );
  }
}
