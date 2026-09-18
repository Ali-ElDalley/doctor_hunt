import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/doctor_details/presentation/widget/doctor_stat_item.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorStatsRow extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorStatsRow({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DoctorStatItem(
            stat: tr.doctorDetails.running,
            count: doctor.runningCount,
          ),
          DoctorStatItem(
            stat: tr.doctorDetails.ongoing,
            count: doctor.ongoingCount,
          ),
          DoctorStatItem(
            stat: tr.doctorDetails.patient,
            count: doctor.patientCount,
          ),
        ],
      ),
    );
  }
}
