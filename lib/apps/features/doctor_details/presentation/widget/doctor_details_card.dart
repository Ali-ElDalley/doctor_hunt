import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailsCard extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDetailsCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 170,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
      ),
      padding: EdgeInsets.only(top: 18, bottom: 18, left: 19, right: 12),
      child: Column(
        spacing: 15,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 92,
                height: 87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.network(doctor.imageUrl),
                ),
              ),
              const SizedBox(width: 12),
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
                                textStyle: context.regular12TextSub,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        doctor.isFavorite
                            ? Icon(
                                Icons.favorite,
                                size: 20,
                                color: AppColors.danger,
                              )
                            : Icon(
                                Icons.favorite_outline,
                                size: 20,
                                color: AppColors.textSub,
                              ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                          rating: doctor.rating,
                          itemCount: 5,
                          itemSize: 18,
                          unratedColor: Colors.grey.shade300,
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.rubik(
                              textStyle: context.regular11TextSub,
                            ),
                            children: [
                              TextSpan(
                                text: "\$ ",
                                style: TextStyle(color: AppColors.primary),
                              ),
                              TextSpan(text: doctor.pricePerHour.toString()),
                              const TextSpan(text: "/Hours"),
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
          CustomButtom(text: tr.doctorDetails.bookNow, width: 140, height: 32),
        ],
      ),
    );
  }
}
