import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/network/test/dummy_data.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/doctor_bloc/doctor_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/doctor_bloc/doctor_state.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/specialties_bloc/specialties_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/user_bloc/user_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/doctor_section.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/greeting_header.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/home_appbar_background.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/popular_doctor_card.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/search_box.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/top_doctor_card.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List catagory = DummyData.catagory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const HomeAppbarBackground(),
                  GreetingHeader(),
                  Positioned(
                    top: 126.h,
                    left: 20.w,
                    right: 20.w,
                    child: SearchBox(
                      readOnly: true,
                      onTap: () => const FindDoctorsRoute().push(context),
                    ),
                  ),
                ],
              ),
            ),
            Gap(24.h),
            SizedBox(
              height: 90.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: catagory.length,
                separatorBuilder: (context, index) => Gap(12.w),
                itemBuilder: (context, index) => Container(
                  width: 80.w,
                  height: 90.h,
                  padding: EdgeInsets.all(22.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: catagory[index]["colors"],
                    ),
                  ),
                  child: SvgPicture.asset(catagory[index]["image"]),
                ),
              ),
            ),
            Gap(24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: DoctorSection(
                title: tr.home.popularDoctors,
                onSeeAll: () => const PopularDoctorsRoute().push(context),
                child: SizedBox(
                  height: 275.h,
                  child: BlocBuilder<DoctorCubit, DoctorState>(
                    builder: (context, state) {
                      List<DoctorModel> doctors = state is DoctorLoadedState
                          ? state.doctors
                          : [];
                      return ListView.separated(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: doctors.isNotEmpty ? doctors.length : 6,
                        separatorBuilder: (context, index) => Gap(15.w),
                        itemBuilder: (context, index) => Skeletonizer(
                          enabled:
                              state is DoctorLoadingState ||
                              state is DoctorInitialState ||
                              doctors.isEmpty,
                          child: InkWell(
                            onTap: doctors.isNotEmpty
                                ? () => DoctorDetailsRout(
                                      doctorId: doctors[index].id,
                                    ).push(context)
                                : null,
                            borderRadius: BorderRadius.circular(12.r),
                            child: doctors.isNotEmpty
                                ? PopularDoctorCard(doctorModel: doctors[index])
                                : PopularDoctorCard(
                                    doctorModel: DoctorModel.skeletonizer(),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Gap(24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: DoctorSection(
                title: tr.home.topDoctors,
                onSeeAll: () {},
                child: SizedBox(
                  height: 145.h,
                  child: BlocBuilder<DoctorCubit, DoctorState>(
                    builder: (context, state) {
                      List<DoctorModel> doctors = state is DoctorLoadedState
                          ? state.doctors
                          : [];
                      return ListView.separated(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: doctors.isNotEmpty ? doctors.length : 6,
                        separatorBuilder: (context, index) => Gap(12.w),
                        itemBuilder: (context, index) => Skeletonizer(
                          enabled:
                              state is DoctorLoadingState ||
                              state is DoctorInitialState ||
                              doctors.isEmpty,
                          child: InkWell(
                            onTap: doctors.isNotEmpty
                                ? () => DoctorDetailsRout(
                                      doctorId: doctors[index].id,
                                    ).push(context)
                                : null,
                            borderRadius: BorderRadius.circular(6.r),
                            child: doctors.isNotEmpty
                                ? TopDoctorCard(doctorModel: doctors[index])
                                : TopDoctorCard(
                                    doctorModel: DoctorModel.skeletonizer(),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Gap(100.h),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(getIt.userRepo)..getCurrentUser(),
        ),
        BlocProvider(
          create: (context) => DoctorCubit(doctorsRepo: getIt.doctorsRepo)..getDoctors(),
        ),
        BlocProvider(
          create: (context) => SpecialtiesCubit(getIt.specialtiesRepo),
        ),
      ],
      child: const HomeView(),
    );
  }
}
