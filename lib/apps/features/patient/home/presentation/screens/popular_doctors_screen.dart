import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/network/test/dummy_data.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/widgets/app_app_bar.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/doctor_list_card.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorsScreen extends StatelessWidget {
  const PopularDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DoctorModel> doctors = DummyData.dummyDoctors;

    return AppScaffold(
      appBar: AppAppBar(
        title: tr.popularDoctors.title,
      ),
      body: doctors.isEmpty
          ? Center(
              child: Text(
                tr.popularDoctors.noDoctors,
                style: context.regular16TextSub,
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              itemCount: doctors.length,
              separatorBuilder: (context, index) => Gap(14.h),
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return DoctorListCard(
                  doctorModel: doctor,
                  onTap: () => DoctorDetailsRout(
                    doctorId: doctor.id,
                  ).push(context),
                );
              },
            ),
    );
  }
}
