import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/network/test/dummy_data.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/core/widgets/app_app_bar.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/patient/doctor_details/presentation/widget/doctor_details_card.dart';
import 'package:doctor_hunt/apps/features/patient/doctor_details/presentation/widget/doctor_stats_row.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final String doctorId;
  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    DoctorModel doctor = DummyData.dummyDoctors.firstWhere(
      (a) => a.id == doctorId,
    );
    return AppScaffold(
      appBar: AppAppBar(title: tr.doctorDetails.title, searchButton: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 34.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorDetailsCard(doctor: doctor),
            Gap(20),
            Center(child: DoctorStatsRow(doctor: doctor)),
            Gap(26),
            Text(
              tr.doctorDetails.services,
              style: GoogleFonts.rubik(textStyle: context.bold20Black),
            ),
            Gap(18),
            SizedBox(
              width: 500.w,
              height: 145.h,
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                itemCount: doctor.services.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.rubik(
                          textStyle: context.medium12TextSub.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: "${index + 1}.  ",
                            style: TextStyle(color: AppColors.primary),
                          ),
                          TextSpan(text: doctor.services[index]),
                        ],
                      ),
                    ),
                    Divider(),
                    Gap(14),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.boxShadow.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.white,
                ),
                child: Image.asset(
                  "${AppImages.test}map.png",
                  width: 318.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
