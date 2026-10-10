import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/apps/core/widgets/app_app_bar.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/doctor_bloc/doctor_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/doctor_bloc/doctor_state.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/doctor_list_card.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/search_box.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDoctorsScreen extends StatelessWidget {
  final String? initialQuery;

  const FindDoctorsScreen({
    super.key,
    this.initialQuery,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DoctorCubit(doctorsRepo: getIt.doctorsRepo)..getDoctors(),
      child: FindDoctorsView(initialQuery: initialQuery),
    );
  }
}

class FindDoctorsView extends StatefulWidget {
  final String? initialQuery;

  const FindDoctorsView({
    super.key,
    this.initialQuery,
  });

  @override
  State<FindDoctorsView> createState() => _FindDoctorsViewState();
}

class _FindDoctorsViewState extends State<FindDoctorsView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery ?? '');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        title: tr.findDoctors.title,
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
            final allDoctors = state.doctors;
            final query = _searchController.text.trim().toLowerCase();
            final filteredDoctors = query.isEmpty 
                ? allDoctors 
                : allDoctors.where((doctor) {
                    final nameMatch = doctor.name.toLowerCase().contains(query);
                    final specialtyMatch = doctor.specialty.toLowerCase().contains(query);
                    return nameMatch || specialtyMatch;
                  }).toList();

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: SearchBox(
                    controller: _searchController,
                    hintText: tr.findDoctors.searchHint,
                    onChanged: (query) {
                      setState(() {});
                    },
                    onClear: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: filteredDoctors.isEmpty
                      ? Center(
                          child: Text(
                            tr.findDoctors.noDoctors,
                            style: context.regular16TextSub,
                          ),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 8.h,
                          ),
                          itemCount: filteredDoctors.length,
                          separatorBuilder: (context, index) => Gap(14.h),
                          itemBuilder: (context, index) {
                            final doctor = filteredDoctors[index];
                            return DoctorListCard(
                              doctorModel: doctor,
                              onTap: () => DoctorDetailsRout(
                                doctorId: doctor.id,
                              ).push(context),
                            );
                          },
                        ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
