import 'package:flutter/material.dart';

class DoctorAvailability {
  final String doctorId;
  final List<DailySlots> availableDates;

  DoctorAvailability({
    required this.doctorId,
    required this.availableDates,
  });
}
class DailySlots {
  final DateTime date;
  final List<TimeOfDay> slots;

  DailySlots({
    required this.date,
    required this.slots,
  });

  String periodOf(TimeOfDay time) {
    if (time.hour < 17) {
      return 'Afternoon';
    } else {
      return 'Evening';
    }
  }

  Map<String, int> countByPeriod() {
    final Map<String, int> counts = {'Afternoon': 0, 'Evening': 0};

    for (final slot in slots) {
      final period = periodOf(slot);
      counts[period] = counts[period]! + 1;
    }

    return counts;
  }
  List<TimeOfDay> slotsByPeriod(String period) {
    return slots.where((slot) => periodOf(slot) == period).toList();
  }
}