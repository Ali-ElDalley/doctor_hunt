import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/patient/main/presentation/widget/menu_logout_button.dart';
import 'package:doctor_hunt/apps/features/patient/main/presentation/widget/menu_nav_list.dart';
import 'package:doctor_hunt/apps/features/patient/main/presentation/widget/menu_user_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientMenuScreen extends StatelessWidget {
  final VoidCallback? onLogout;

  const PatientMenuScreen({
    super.key,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.menuGradientStart,
              AppColors.menuGradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(16.h),
                const MenuUserProfileHeader(),
                Gap(50.h),
                const MenuNavList(),
                const Spacer(),
                MenuLogoutButton(onLogout: onLogout),
                Gap(16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
