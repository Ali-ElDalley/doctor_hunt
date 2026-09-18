import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const AuthAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () => context.pop(),
        child: Row(
          spacing: 10,
          children: [
            Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.primary,
              size: 30,
            ),
            Text(text, style: context.bold28Primary),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
