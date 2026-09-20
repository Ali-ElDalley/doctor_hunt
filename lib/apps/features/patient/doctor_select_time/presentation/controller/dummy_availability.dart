import 'package:doctor_hunt/apps/core/models/doctor_availability.dart';
import 'package:flutter/material.dart';

class DummyAvailability {
  List<DoctorAvailability> getDummyAvailability() {
    return [
      DoctorAvailability(
        doctorId: '1',
        availableDates: [
          DailySlots(
            date: DateTime.now(),
            slots: [
              TimeOfDay(hour: 8, minute: 0),
              TimeOfDay(hour: 9, minute: 0),
              TimeOfDay(hour: 10, minute: 0),
              TimeOfDay(hour: 11, minute: 0),
              TimeOfDay(hour: 12, minute: 0),
              TimeOfDay(hour: 13, minute: 0),
              TimeOfDay(hour: 14, minute: 0),
              TimeOfDay(hour: 16, minute: 0),
              TimeOfDay(hour: 17, minute: 0),
            ],
          ),
          DailySlots(
            date: DateTime.now().add(Duration(days: 1)),
            slots: [
              TimeOfDay(hour: 14, minute: 0),
              TimeOfDay(hour: 15, minute: 0),
              TimeOfDay(hour: 17, minute: 0),
            ],
          ),
        ],
      ),
      DoctorAvailability(
        doctorId: '2',
        availableDates: [
          DailySlots(
            date: DateTime.now().add(Duration(days: 1)),
            slots: [
              TimeOfDay(hour: 14, minute: 0),
              TimeOfDay(hour: 16, minute: 0),
              TimeOfDay(hour: 17, minute: 0),
            ],
          ),
          DailySlots(
            date: DateTime.now().add(Duration(days: 2)),
            slots: [
              TimeOfDay(hour: 9, minute: 0),
              TimeOfDay(hour: 10, minute: 0),
              TimeOfDay(hour: 12, minute: 0),
            ],
          ),
        ],
      ),
      DoctorAvailability(
        doctorId: '3',
        availableDates: [
          DailySlots(
            date: DateTime.now(),
            slots: [
              TimeOfDay(hour: 9, minute: 0),
              TimeOfDay(hour: 10, minute: 0),
              TimeOfDay(hour: 11, minute: 0),
            ],
          ),
          DailySlots(
            date: DateTime.now().add(Duration(days: 1)),
            slots: [
              TimeOfDay(hour: 14, minute: 0),
              TimeOfDay(hour: 16, minute: 0),
              TimeOfDay(hour: 17, minute: 0),
            ],
          ),
        ],
      ),
      DoctorAvailability(
        doctorId: '4',
        availableDates: [
          DailySlots(
            date: DateTime.now(),
            slots: [
              TimeOfDay(hour: 9, minute: 0),
              TimeOfDay(hour: 10, minute: 0),
              TimeOfDay(hour: 11, minute: 0),
              TimeOfDay(hour: 12, minute: 0),
            ],
          ),
          DailySlots(
            date: DateTime.now().add(Duration(days: 1)),
            slots: [
              TimeOfDay(hour: 14, minute: 0),
              TimeOfDay(hour: 15, minute: 0),
              TimeOfDay(hour: 16, minute: 0),
              TimeOfDay(hour: 17, minute: 0),
            ],
          ),
        ],
      ),
      DoctorAvailability(
        doctorId: '5',
        availableDates: [
          DailySlots(
            date: DateTime.now(),
            slots: [
              TimeOfDay(hour: 9, minute: 0),
              TimeOfDay(hour: 10, minute: 0),
              TimeOfDay(hour: 11, minute: 0),
              TimeOfDay(hour: 12, minute: 0),
            ],
          ),
          DailySlots(
            date: DateTime.now().add(Duration(days: 1)),
            slots: [
              TimeOfDay(hour: 14, minute: 0),
              TimeOfDay(hour: 15, minute: 0),
              TimeOfDay(hour: 16, minute: 0),
              TimeOfDay(hour: 17, minute: 0),
            ],
          ),
        ],
      ),
    ];
  }
}
