import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final bool isClickable;
  final void Function()? onTap;
  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.isClickable = true,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isClickable ? onTap : null,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isClickable ? AppColors.primary : Colors.grey,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(child: Text(text, style: context.bold16White)),
      ),
    );
  }
}
