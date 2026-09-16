import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? searchButton;
  const AppAppBar({super.key, required this.title, this.searchButton = false});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: Icon(Icons.arrow_back_ios_new, size: 18),
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.rubik(textStyle: context.bold22Black),
        ),

        actions: searchButton!
            ? [
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 40,
                  child: Icon(Icons.search, size: 36),
                ),
              ]
            : null,
      ),
    );
  }
}
