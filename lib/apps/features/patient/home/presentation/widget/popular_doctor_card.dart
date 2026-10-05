import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorCard extends StatelessWidget {
  final DoctorModel doctorModel;
  const PopularDoctorCard({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      height: 264.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: SizedBox(
              width: 190.w,
              height: 180.h,
              child: Image.network(
                doctorModel.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  child: Icon(Icons.person, size: 50.sp, color: Colors.grey),
                ),
              ),
            ),
          ),
          Gap(10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              doctorModel.name,
              style: context.medium18Black,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Gap(2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              doctorModel.specialty,
              style: context.light12TextSub,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Gap(6.h),
          RatingBarIndicator(
            rating: doctorModel.rating,
            itemBuilder: (context, _) =>
                const Icon(Icons.star, color: Color(0xFFF6D060)),
            itemCount: 5,
            itemSize: 13.sp,
            unratedColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
