import 'package:doctor_hunt/apps/features/main/widget/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Root extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const Root({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}
