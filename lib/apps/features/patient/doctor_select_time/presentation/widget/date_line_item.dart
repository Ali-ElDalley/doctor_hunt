
import 'package:doctor_hunt/apps/core/extensions/display_time_date_extensions.dart';
import 'package:doctor_hunt/apps/core/models/doctor_availability.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatelineItem extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final bool isDisabled;
  final bool isToday;
  final VoidCallback onTap;
  final DoctorAvailability doctorAvailability;

  const DatelineItem({
    super.key,
    required this.date,
    required this.isSelected,
    required this.isDisabled,
    required this.isToday,
    required this.onTap,
    required this.doctorAvailability,
  });

  @override
  Widget build(BuildContext context) {
    final matchingDates = doctorAvailability.availableDates.where(
      (d) =>
          d.date.year == date.year &&
          d.date.month == date.month &&
          d.date.day == date.day,
    );
    final dailySlots = matchingDates.isEmpty ? null : matchingDates.first;

    final slotsCount = dailySlots?.slots.length ?? 0;

    final String subLabel = slotsCount > 0
        ? '$slotsCount slots available'
        : 'No slots available';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.textBorders),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              date.timelineLabel,
              style:  isSelected
                    ? context.semiBold14White
                    : context.semiBold14Black,
              
            ),
            Text(
              subLabel,
              style: isSelected
                    ? context.regular11White
                    : context.regular11TextSub,
              
            ),
          ],
        ),
      ),
    );
  }
}
