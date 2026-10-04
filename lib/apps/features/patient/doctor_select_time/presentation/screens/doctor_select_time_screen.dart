import 'package:doctor_hunt/apps/core/extensions/display_time_date_extensions.dart';
import 'package:doctor_hunt/apps/core/models/doctor_availability.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/network/test/dummy_data.dart';
import 'package:doctor_hunt/apps/core/widgets/app_app_bar.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/patient/doctor_select_time/presentation/controller/dummy_availability.dart';
import 'package:doctor_hunt/apps/features/patient/doctor_select_time/presentation/widget/date_line_item.dart';
import 'package:doctor_hunt/apps/features/patient/doctor_select_time/presentation/widget/doctor_select_card.dart';
import 'package:doctor_hunt/apps/features/patient/doctor_select_time/presentation/widget/time_line_item.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSelectTimeScreen extends StatefulWidget {
  final String doctorId;
  const DoctorSelectTimeScreen({super.key, required this.doctorId});

  @override
  State<DoctorSelectTimeScreen> createState() => _DoctorSelectTimeScreenState();
}

class _DoctorSelectTimeScreenState extends State<DoctorSelectTimeScreen> {
  DateTime selectedDate = DateTime.now();
  var selectedTime = TimeOfDay(hour: 1, minute: 00);

  @override
  Widget build(BuildContext context) {
    DoctorModel doctor = DummyData.dummyDoctors.firstWhere(
      (a) => a.id == widget.doctorId,
    );
    DoctorAvailability doctorAvailability = DummyAvailability()
        .getDummyAvailability()
        .firstWhere((a) => a.doctorId == doctor.id);

    final matchingDates = doctorAvailability.availableDates.where(
      (d) =>
          d.date.year == selectedDate.year &&
          d.date.month == selectedDate.month &&
          d.date.day == selectedDate.day,
    );
    final dailySlots = matchingDates.isEmpty ? null : matchingDates.first;

    final slotsCount = dailySlots?.slots.length ?? 0;
    final bool unAvailableSlots = slotsCount == 0;
    final Map<String, int>? periodCounts = dailySlots?.countByPeriod();
    return AppScaffold(
      appBar: AppAppBar(title: "Select Time"),
      body: Padding(
        padding: EdgeInsetsDirectional.only(top: 34.h, start: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DoctorSelectCard(doctor: doctor),
              Gap(24.h),
              EasyDateTimeLinePicker.itemBuilder(
                timelineOptions: TimelineOptions(height: 54.h),
                headerOptions: HeaderOptions(headerType: HeaderType.none),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 7)),
                focusedDate: selectedDate,
                onDateChange: (DateTime date) => setState(() {
                  selectedDate = date;
                }),
                itemBuilder:
                    (context, date, isSelected, isDisabled, isToday, onTap) {
                      return DatelineItem(
                        date: date,
                        isSelected: isSelected,
                        isDisabled: isDisabled,
                        isToday: isToday,
                        onTap: onTap,
                        doctorAvailability: doctorAvailability,
                      );
                    },
                itemExtent: 150.w,
              ),
              Gap(19.h),
              Center(
                child: Text(
                  selectedDate.timelineLabel,
                  style: context.semiBold22Black,
                ),
              ),
              Gap(23),
              unAvailableSlots
                  ? Text(
                      "No slots available",
                      style: context.medium14TextPlaceholder,
                    )
                  : Column(
                      children: [
                        periodCounts!["Afternoon"] != 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Aftermoon ${periodCounts["Afternoon"]} slots",
                                    style: context.medium16Black,
                                  ),
                                  Gap(10),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          mainAxisExtent: 40.h,
                                          crossAxisSpacing: 8.w,
                                          mainAxisSpacing: 8.h,
                                        ),
                                    itemCount: dailySlots!
                                        .slotsByPeriod("Afternoon")
                                        .length,

                                    itemBuilder: (context, index) {
                                      final slots = dailySlots.slotsByPeriod(
                                        "Afternoon",
                                      );
                                      final bool isSelected =
                                          slots[index] == selectedTime;
                                      return InkWell(
                                        onTap: () => setState(() {
                                          selectedTime = slots[index];
                                        }),
                                        child: TimeLineItem(
                                          slot: slots[index],
                                          isSelected: isSelected,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                        Gap(30.h),
                        periodCounts["Evening"] != 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Evening ${periodCounts["Evening"]} slots",
                                    style: context.medium16Black,
                                  ),
                                  Gap(10),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          mainAxisExtent: 40.h,
                                          crossAxisSpacing: 8.w,
                                          mainAxisSpacing: 8.h,
                                        ),
                                    itemCount: dailySlots!
                                        .slotsByPeriod("Evening")
                                        .length,

                                    itemBuilder: (context, index) {
                                      final slots = dailySlots.slotsByPeriod(
                                        "Evening",
                                      );
                                      final bool isSelected =
                                          slots[index] == selectedTime;
                                      return InkWell(
                                        onTap: () => setState(() {
                                          selectedTime = slots[index];
                                        }),
                                        child: TimeLineItem(
                                          slot: slots[index],
                                          isSelected: isSelected,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
