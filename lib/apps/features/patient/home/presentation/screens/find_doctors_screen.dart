import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/network/test/dummy_data.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/widgets/app_app_bar.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/doctor_list_card.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/widget/search_box.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDoctorsScreen extends StatefulWidget {
  final String? initialQuery;

  const FindDoctorsScreen({
    super.key,
    this.initialQuery,
  });

  @override
  State<FindDoctorsScreen> createState() => _FindDoctorsScreenState();
}

class _FindDoctorsScreenState extends State<FindDoctorsScreen> {
  late final TextEditingController _searchController;
  List<DoctorModel> _allDoctors = [];
  List<DoctorModel> _filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    _allDoctors = DummyData.dummyDoctors;
    _searchController = TextEditingController(text: widget.initialQuery ?? '');
    _filterDoctors(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterDoctors(String query) {
    final trimmed = query.trim().toLowerCase();
    setState(() {
      if (trimmed.isEmpty) {
        _filteredDoctors = List.from(_allDoctors);
      } else {
        _filteredDoctors = _allDoctors.where((doctor) {
          final nameMatch = doctor.name.toLowerCase().contains(trimmed);
          final specialtyMatch =
              doctor.specialty.toLowerCase().contains(trimmed);
          return nameMatch || specialtyMatch;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        title: tr.findDoctors.title,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: SearchBox(
              controller: _searchController,
              hintText: tr.findDoctors.searchHint,
              onChanged: _filterDoctors,
              onClear: () => _filterDoctors(''),
            ),
          ),
          Expanded(
            child: _filteredDoctors.isEmpty
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
                    itemCount: _filteredDoctors.length,
                    separatorBuilder: (context, index) => Gap(14.h),
                    itemBuilder: (context, index) {
                      final doctor = _filteredDoctors[index];
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
      ),
    );
  }
}
