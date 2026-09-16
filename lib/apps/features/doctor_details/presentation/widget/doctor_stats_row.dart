import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/doctor_details/presentation/widget/doctor_stat_item.dart';
import 'package:flutter/material.dart';

class DoctorStatsRow extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorStatsRow({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
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
          DoctorStatItem(stat: "Runing", count: doctor.runningCount),
          DoctorStatItem(stat: "Ongoing", count: doctor.ongoingCount),
          DoctorStatItem(stat: "Patient", count: doctor.patientCount),
        ],
      ),
    );
  }
}
