import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorStatItem extends StatelessWidget {
  final String stat;
  final int count;
  const DoctorStatItem({super.key, required this.stat, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.boxShadow.withValues(alpha: 0.05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: GoogleFonts.rubik(textStyle: context.semiBold18Black),
          ),
          Text(
            stat,
            style: GoogleFonts.rubik(textStyle: context.regular14TextSub),
          ),
        ],
      ),
    );
  }
}
