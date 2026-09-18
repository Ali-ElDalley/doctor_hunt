import 'dart:ui';

import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppBackGround extends StatelessWidget {
  const AppBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -45,
          bottom: -45,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: CircleAvatar(
              radius: 108,
              backgroundColor: AppColors.primary.withValues(alpha: 0.13),
            ),
          ),
        ),
        Positioned(
          left: -95,
          top: -95,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: CircleAvatar(
              radius: 160,
              backgroundColor: Color(0xff61CEFF).withValues(alpha: 0.13),
            ),
          ),
        ),
      ],
    );
  }
}
