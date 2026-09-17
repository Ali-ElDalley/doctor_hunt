import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/network/test/dummy_data.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widget/doctor_section.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widget/feature_doctor_card.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widget/greeting_header.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widget/home_appbar_background.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widget/live_card.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widget/popular_doctor_card.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widget/search_box.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 20,
  );
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
              height: 220,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  HomeAppbarBackground(),
                  GreetingHeader(),
                  Positioned(top: 155, left: 40, right: 40, child: SearchBox()),
                ],
              ),
            ),
            Padding(
              padding: padding,
              child: DoctorSection(
                title: tr.home.liveDoctors,
                child: SizedBox(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyDoctor.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: LiveCard(image: dummyDoctor[index].imageUrl),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catagory.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 90,
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          begin: AlignmentGeometry.topLeft,
                          end: AlignmentGeometry.bottomRight,
                          colors: catagory[index]["colors"],
                        ),
                      ),
                      child: SvgPicture.asset(catagory[index]["image"]),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: DoctorSection(
                title: tr.home.popularDoctors,
                onSeeAll: () {},
                child: SizedBox(
                  height: 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyDoctor.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () => DoctorDetailsRout(
                          doctorId: dummyDoctor[index].id,
                        ).push(context),
                        child: PopularDoctorCard(
                          doctorModel: dummyDoctor[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: DoctorSection(
                title: tr.home.featureDoctors,
                onSeeAll: () {},
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyDoctor.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () => DoctorDetailsRout(
                          doctorId: dummyDoctor[index].id,
                        ).push(context),
                        child: FeatureDoctorCard(
                          doctorModel: dummyDoctor[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
