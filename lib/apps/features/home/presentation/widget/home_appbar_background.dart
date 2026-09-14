import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppbarBackground extends StatelessWidget {
  const HomeAppbarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
        ),
      ),
    );
  }
}
