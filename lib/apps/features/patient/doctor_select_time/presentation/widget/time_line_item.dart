import 'package:doctor_hunt/apps/core/extensions/display_time_date_extensions.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class TimeLineItem extends StatelessWidget {
  final TimeOfDay slot;
  final bool isSelected;
  const TimeLineItem({super.key, required this.slot, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isSelected
            ? AppColors.primary
            : AppColors.primaryLight.withValues(alpha: 0.3),
      ),
      child: Center(
        child: Text(
          slot.formatted,
          style:  isSelected
                ? context.medium14White
                : context.medium14PrimaryDark,
          
        ),
      ),
    );
  }
}
