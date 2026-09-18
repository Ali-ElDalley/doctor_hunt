import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleCard extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;
  final bool isSelected;
  const RoleCard({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 164.h,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.secondaryLight.withValues(alpha: 0.1)
            : AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          width: 2,
          color: isSelected ? AppColors.primaryDark : Color(0xffE6ECEA),
        ),
      ),
      child: Stack(
        children: [
          isSelected
              ? Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.primaryDark,
                    child: Icon(Icons.check, size: 25, color: AppColors.white),
                  ),
                )
              : SizedBox.shrink(),
          Positioned(
            left: 24,
            top: 30,
            child: Row(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: isSelected
                      ? AppColors.white
                      : Color(0xffE8F0E8),
                  child: Icon(
                    icon,
                    size: 40,
                    color: isSelected
                        ? AppColors.primaryDark
                        : Color(0xff7B8490),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: context.semiBold20Black,
                      ),
                    ),
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        desc,
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: context.regular14TextSub,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
