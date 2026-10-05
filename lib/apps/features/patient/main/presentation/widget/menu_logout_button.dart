import 'package:doctor_hunt/apps/core/extensions/build_context_ex.dart';
import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuLogoutButton extends StatelessWidget {
  final VoidCallback? onLogout;

  const MenuLogoutButton({super.key, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final cubit = AuthCubit(getIt.authRepo);
        if (onLogout != null) {
          onLogout!();
        } else {
          context.closeDrawer();
          await cubit.signOut();
          cubit.close();
          if (context.mounted) {
            const LoginScreenRoute(role: 'patient').go(context);
          }
        }
      },
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.power_settings_new_rounded,
              color: AppColors.white,
              size: 22.sp,
            ),
            Gap(12.w),
            Text(tr.menu.logout, style: context.medium20White),
          ],
        ),
      ),
    );
  }
}
