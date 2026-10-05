import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuUserProfileHeader extends StatelessWidget {
  const MenuUserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getIt.supabase.auth.currentUser;
    final String name =
        user?.userMetadata?['name'] as String? ?? 'Abdullah Mamun';
    final String phoneOrEmail =
        user?.phone ?? user?.email ?? '01303-527300';
    final String? avatarUrl =
        user?.userMetadata?['avatar_url'] as String?;

    return Row(
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundColor: AppColors.white.withValues(alpha: 0.24),
          backgroundImage: avatarUrl != null
              ? NetworkImage(avatarUrl)
              : const NetworkImage(
                  'https://randomuser.me/api/portraits/men/32.jpg',
                ),
        ),
        Gap(12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: context.medium16White,
            ),
            Gap(4.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.phone,
                  size: 11.sp,
                  color: AppColors.white.withValues(alpha: 0.7),
                ),
                Gap(4.w),
                Text(
                  phoneOrEmail,
                  style: context.regular12White,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
