import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopDoctorCard extends StatelessWidget {
  final DoctorModel doctorModel;
  const TopDoctorCard({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98.w,
      height: 100.h,
      padding: EdgeInsets.only(top: 9.h, left: 10.w, right: 10.w, bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                doctorModel.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline,
                size: 11.sp,
                color: doctorModel.isFavorite
                    ? AppColors.danger
                    : const Color(0xFF777EA5),
              ),
              const Spacer(),
              Icon(Icons.star, color: const Color(0xFFF6D060), size: 10.sp),
              Gap(2.w),
              Text(
                doctorModel.rating.toStringAsFixed(1),
                style: context.regular11TextSub,
              ),
            ],
          ),
          Gap(9.h),
          CircleAvatar(
            radius: 27.r,
            backgroundImage: NetworkImage(doctorModel.imageUrl),
            backgroundColor: Colors.grey.shade200,
          ),
          Gap(20.h),
          Text(
            doctorModel.name,
            style: context.medium12Black,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
