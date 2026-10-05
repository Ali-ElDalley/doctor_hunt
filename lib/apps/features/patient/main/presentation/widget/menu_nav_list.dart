import 'package:doctor_hunt/apps/core/extensions/build_context_ex.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/features/patient/main/presentation/widget/menu_nav_tile.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuNavList extends StatelessWidget {
  const MenuNavList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MenuNavTile(
          icon: Icons.home_outlined,
          title: tr.menu.home,
          onTap: () {
            context.closeDrawer();
            const HomeRoute().go(context);
          },
        ),
        Gap(34.h),
        MenuNavTile(
          icon: Icons.favorite_border,
          title: tr.menu.favourites,
          onTap: () {
            context.closeDrawer();
            const FavoritesRoute().go(context);
          },
        ),
        Gap(34.h),
        MenuNavTile(
          icon: Icons.calendar_today_outlined,
          title: tr.menu.myAppointments,
          onTap: () {
            context.closeDrawer();
            const BookmarksRoute().go(context);
          },
        ),
        Gap(34.h),
        MenuNavTile(
          icon: Icons.settings_outlined,
          title: tr.menu.settings,
          onTap: () {
            context.closeDrawer();
            const ChatRoute().go(context);
          },
        ),
      ],
    );
  }
}
