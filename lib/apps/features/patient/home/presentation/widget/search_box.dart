import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool autofocus;
  final String? hintText;

  const SearchBox({
    super.key,
    this.controller,
    this.onChanged,
    this.onClear,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        width: 335.w,
        height: 54.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 18.sp,
              color: AppColors.textPlaceholder,
            ),
            Gap(12.w),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                readOnly: readOnly,
                autofocus: autofocus,
                onTap: onTap,
                decoration: InputDecoration(
                  hintText: hintText ?? tr.home.search,
                  hintStyle: context.regular14TextPlaceholder,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller?.clear();
                if (onClear != null) {
                  onClear!();
                } else if (onChanged != null) {
                  onChanged!('');
                }
              },
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: Icon(
                  Icons.close,
                  size: 16.sp,
                  color: AppColors.textPlaceholder,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
