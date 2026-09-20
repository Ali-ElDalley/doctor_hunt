import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeTimelineExtension on DateTime {
  String get timelineLabel {
    final now = DateTime.now();
    final tomorrow = now.add(const Duration(days: 1));

    final isToday = year == now.year && month == now.month && day == now.day;
    final isTomorrow =
        year == tomorrow.year && month == tomorrow.month && day == tomorrow.day;

    final String dayLabel = isToday
        ? 'Today'
        : isTomorrow
            ? 'Tomorrow'
            : DateFormat('EEE').format(this);

    return '$dayLabel, $day ${DateFormat('MMM').format(this)}';
  }
}
extension TimeOfDayFormatExtension on TimeOfDay {
  String get formatted {
    final int hourIn12 = hourOfPeriod == 0 ? 12 : hourOfPeriod;
    final String minuteStr = minute.toString().padLeft(2, '0');
    final String period = this.period == DayPeriod.am ? 'AM' : 'PM';

    return '$hourIn12:$minuteStr $period';
  }
}