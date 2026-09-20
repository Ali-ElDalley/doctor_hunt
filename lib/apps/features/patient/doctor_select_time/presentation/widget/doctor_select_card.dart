import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorSelectCard extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorSelectCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 88.h,
      margin: EdgeInsetsDirectional.only(end: 20.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
      ),
      padding: EdgeInsetsDirectional.only(
        top: 10.h,
        bottom: 10.h,
        start: 10.w,
        end: 15.w,
      ),
      child: Row(
        spacing: 4.w,
        children: [
          Container(
            width: 72.w,
            height: 68.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8.r),
              child: Image.network(doctor.imageUrl),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 234.w,
                height: 20.h,
                child: Row(
                  children: [
                    Text(
                      doctor.name,
                      style: GoogleFonts.rubik(
                        textStyle: context.semiBold18Black,
                      ),
                    ),
                    Spacer(),
                    doctor.isFavorite
                        ? Icon(
                            Icons.favorite,
                            size: 30,
                            color: AppColors.danger,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            size: 30,
                            color: AppColors.textSub,
                          ),
                  ],
                ),
              ),
              Text(
                doctor.specialty,
                textAlign: TextAlign.left,
                style: GoogleFonts.rubik(textStyle: context.regular16TextSub),
              ),
              RatingBarIndicator(
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                rating: doctor.rating,
                itemCount: 5,
                itemSize: 22,
                unratedColor: Colors.grey.shade300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
