import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final void Function()? onTap;
  const CustomButtom({
    super.key,
    required this.text,
    this.onTap,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(child: Text(text, style: context.bold16White)),
      ),
    );
  }
}
