import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/role_card.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                Image.asset(AppImages.logo),
                Gap(50),
                Text(
                  "Choose your role",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: context.regular28Black,
                  ),
                ),
                Gap(10),
                Text(
                  "The selected role determines the experience and available features.",
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
                    title: 'Patient',
                    desc:
                        'Find doctors, book appointments, and manage your medical records.',
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
                    title: 'Admin',
                    desc:
                        'Manage doctors, appointments, users, and the platform.',
                    icon: Icons.grid_view_outlined,
                    isSelected: selectedRole == 1,
                  ),
                ),
                Spacer(),
                CustomButtom(
                  text: "Continue",
                  onTap: () => LoginRoute().go(context),
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
