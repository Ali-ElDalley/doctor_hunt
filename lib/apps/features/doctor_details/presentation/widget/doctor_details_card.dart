import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailsCard extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDetailsCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 170.h,
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
      padding: EdgeInsets.only(
        top: 18.h,
        bottom: 18.h,
        left: 19.w,
        right: 12.w,
      ),
      child: Column(
        spacing: 15,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 92.w,
                height: 87.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8.r),
                  child: Image.network(doctor.imageUrl),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.name,
                              style: GoogleFonts.rubik(
                                textStyle: context.semiBold18Black,
                              ),
                            ),
                            Text(
                              doctor.specialty,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.rubik(
                                textStyle: context.regular16TextSub,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                    Gap(10),
                    Row(
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                          rating: doctor.rating,
                          itemCount: 5,
                          itemSize: 22,
                          unratedColor: Colors.grey.shade300,
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.rubik(
                              textStyle: context.regular16TextSub,
                            ),
                            children: [
                              TextSpan(
                                text: "\$ ",
                                style: TextStyle(color: AppColors.primary),
                              ),
                              TextSpan(text: doctor.pricePerHour.toString()),
                              TextSpan(text: tr.doctorDetails.hour),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomButtom(
            text: tr.doctorDetails.bookNow,
            width: 140.w,
            height: 32.h,
          ),
        ],
      ),
    );
  }
}
