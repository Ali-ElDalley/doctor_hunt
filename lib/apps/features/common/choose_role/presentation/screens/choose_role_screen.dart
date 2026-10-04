import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/core/widgets/app_button.dart';
import 'package:doctor_hunt/apps/features/common/choose_role/presentation/widget/role_card.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  String selectedRole = "patient";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Center(
            child: Column(
              children: [
                Image.asset(AppImages.logo),
                Gap(50),
                Text(tr.chooseRole.title, style: context.regular28Black),
                Gap(10),
                Text(
                  tr.chooseRole.sub,
                  style: context.regular14TextSub,

                  textAlign: TextAlign.center,
                ),
                Gap(32),
                InkWell(
                  onTap: () => setState(() {
                    selectedRole = "patient";
                  }),
                  child: RoleCard(
                    title: tr.chooseRole.patient.title,
                    desc: tr.chooseRole.patient.sub,
                    icon: Icons.person_outline,
                    isSelected: selectedRole == "patient",
                  ),
                ),
                Gap(16),
                InkWell(
                  onTap: () => setState(() {
                    selectedRole = "admin";
                  }),
                  child: RoleCard(
                    title: tr.chooseRole.admin.title,
                    desc: tr.chooseRole.admin.sub,
                    icon: Icons.grid_view_outlined,
                    isSelected: selectedRole == "admin",
                  ),
                ),
                Spacer(),
                AppButton(
                  text: tr.chooseRole.button,
                  height: 56.h,
                  width: 350.w,
                  onTap: () => LoginScreenRoute(role: selectedRole).push(context),
                ),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
