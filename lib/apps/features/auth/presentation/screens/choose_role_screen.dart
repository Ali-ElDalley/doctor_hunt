import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/role_card.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  int selectedRole = 0;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                Image.asset(AppImages.logo),
                Gap(50),
                Text(
                  tr.chooseRole.title,
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: context.regular28Black,
                  ),
                ),
                Gap(10),
                Text(
                  tr.chooseRole.sub,
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: context.regular14TextSub,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(32),
                InkWell(
                  onTap: () => setState(() {
                    selectedRole = 0;
                  }),
                  child: RoleCard(
                    title: tr.chooseRole.patient.title,
                    desc: tr.chooseRole.patient.sub,
                    icon: Icons.person_outline,
                    isSelected: selectedRole == 0,
                  ),
                ),
                Gap(16),
                InkWell(
                  onTap: () => setState(() {
                    selectedRole = 1;
                  }),
                  child: RoleCard(
                    title: tr.chooseRole.admin.title,
                    desc: tr.chooseRole.admin.sub,
                    icon: Icons.grid_view_outlined,
                    isSelected: selectedRole == 1,
                  ),
                ),
                Spacer(),
                CustomButtom(
                  text: tr.chooseRole.button,
                  height: 56,
                  width: 350,
                  onTap: () => LoginRoute().push(context),
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
