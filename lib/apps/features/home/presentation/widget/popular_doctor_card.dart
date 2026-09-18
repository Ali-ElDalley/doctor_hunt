import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularDoctorCard extends StatelessWidget {
  final DoctorModel doctorModel;
  const PopularDoctorCard({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      height: 280.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 190.w,
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.boxShadow.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(doctorModel.imageUrl, fit: BoxFit.cover),
            ),
          ),
          Gap(14),
          Text(
            doctorModel.name,
            style: GoogleFonts.rubik(textStyle: context.semiBold18Black),
          ),
          Text(
            doctorModel.specialty,
            style: GoogleFonts.rubik(textStyle: context.regular12TextSub),
          ),
          Gap(3),
          RatingBarIndicator(
            itemBuilder: (context, _) =>
                const Icon(Icons.star, color: Colors.amber),
            rating: doctorModel.rating,
            itemCount: 5,
            itemSize: 18,
            unratedColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
