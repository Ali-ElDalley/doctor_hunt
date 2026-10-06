import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/network/test/dummy_data.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/doctor_section.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/greeting_header.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/home_appbar_background.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/popular_doctor_card.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/search_box.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/top_doctor_card.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List catagory = DummyData.catagory;
  final List<DoctorModel> dummyDoctor = DummyData.dummyDoctors;

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
                  const GreetingHeader(),
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
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyDoctor.length,
                    separatorBuilder: (context, index) => Gap(15.w),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => DoctorDetailsRout(
                        doctorId: dummyDoctor[index].id,
                      ).push(context),
                      borderRadius: BorderRadius.circular(12.r),
                      child: PopularDoctorCard(
                        doctorModel: dummyDoctor[index],
                      ),
                    ),
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
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyDoctor.length,
                    separatorBuilder: (context, index) => Gap(12.w),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => DoctorDetailsRout(
                        doctorId: dummyDoctor[index].id,
                      ).push(context),
                      borderRadius: BorderRadius.circular(6.r),
                      child: TopDoctorCard(
                        doctorModel: dummyDoctor[index],
                      ),
                    ),
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
