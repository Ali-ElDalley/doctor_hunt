import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/apps/core/widgets/app_app_bar.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/doctor_bloc/doctor_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/doctor_bloc/doctor_state.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/doctor_list_card.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorsScreen extends StatelessWidget {
  const PopularDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DoctorCubit(doctorsRepo: getIt.doctorsRepo)..getDoctors(),
      child: const PopularDoctorsView(),
    );
  }
}

class PopularDoctorsView extends StatelessWidget {
  const PopularDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        title: tr.popularDoctors.title,
      ),
      body: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (context, state) {
          if (state is DoctorErrorState) {
            return Center(
              child: Text(
                state.message,
                style: context.regular16TextSub,
              ),
            );
          }
          if (state is DoctorLoadingState || state is DoctorInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DoctorLoadedState) {
            final doctors = state.doctors;
            return doctors.isEmpty
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
                  );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
