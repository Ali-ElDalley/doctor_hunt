import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureDoctorCard extends StatelessWidget {
  final DoctorModel doctorModel;
  const FeatureDoctorCard({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 150.h,
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
      child: Column(
        children: [
          Row(
            children: [
              doctorModel.isFavorite
                  ? Icon(Icons.favorite, size: 20, color: AppColors.danger)
                  : Icon(
                      Icons.favorite_outline,
                      size: 20,
                      color: AppColors.textSub,
                    ),
              Spacer(),
              Icon(Icons.star, color: Colors.amber, size: 20),
              Text(
                " ${doctorModel.rating}",
                style: GoogleFonts.rubik(textStyle: context.semiBold11Black),
              ),
            ],
          ),
          Gap(5),
          CircleAvatar(
            backgroundImage: NetworkImage(doctorModel.imageUrl),
            radius: 35,
          ),
          Gap(14),
          Text(
            doctorModel.name,
            style: GoogleFonts.rubik(textStyle: context.semiBold14Black),
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.rubik(textStyle: context.regular11TextSub),
              children: [
                TextSpan(
                  text: "\$ ",
                  style: TextStyle(color: AppColors.primary),
                ),
                TextSpan(text: doctorModel.pricePerHour.toString()),
                TextSpan(text: "/Hours"),
              ],
            ),
          ),
          Gap(3),
        ],
      ),
    );
  }
}
