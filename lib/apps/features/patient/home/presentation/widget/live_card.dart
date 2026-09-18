import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveCard extends StatelessWidget {
  final String image;
  const LiveCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 117.w,
          height: 168.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.boxShadow.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(6),
            child: Image.network(image, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          left: 35,
          top: 70,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("${AppImages.home}video.png"),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            width: 40.w,
            height: 18.h,
            decoration: BoxDecoration(
              color: AppColors.danger,
              borderRadius: BorderRadius.circular(3.r),
            ),
            child: Row(
              spacing: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 5, backgroundColor: AppColors.white),
                Text("Live", style: context.light11White),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
