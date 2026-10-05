import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/patient/main/presentation/screens/patient_menu_screen.dart';
import 'package:doctor_hunt/apps/features/patient/main/presentation/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';

class Root extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const Root({super.key, required this.navigationShell});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final ZoomDrawerController _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      menuScreen: const PatientMenuScreen(),
      mainScreen: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: BottomNavBar(
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (index) => widget.navigationShell.goBranch(
            index,
            initialLocation: index == widget.navigationShell.currentIndex,
          ),
        ),
      ),
      borderRadius: 30.r,
      showShadow: true,
      angle: 0.0,
      slideWidth: 260.w,
      dragOffset: 150.w,
      openDragSensitivity: 300,
      isRtl: false,
      mainScreenTapClose: true,
      androidCloseOnBackTap: true,
      menuBackgroundColor: AppColors.menuGradientStart,
      shadowLayer1Color: AppColors.white.withValues(alpha: 0.15),
      shadowLayer2Color: AppColors.white.withValues(alpha: 0.25),
    );
  }
}
