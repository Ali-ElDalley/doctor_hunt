import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 54.h,
      padding: EdgeInsetsDirectional.only(start: 16.w, end: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.textPlaceholder),
          Gap(8),
          SizedBox(
            width: 245.w,
            child: TextField(
              decoration: InputDecoration(
                hintText: tr.home.search,
                hintStyle: context.regular14TextPlaceholder,
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          Spacer(),
          Icon(Icons.close, color: AppColors.textPlaceholder),
        ],
      ),
    );
  }
}
