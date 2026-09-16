import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/auth_app_bar.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/custom_form_field.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AuthAppBar(text: "Cancel"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              Text("Create New Password", style: context.bold28Primary),
              Gap(12),
              CustomFormField(
                lable: "Password",
                hint: "********",
                isPassword: true,
              ),
              Gap(16),
              CustomFormField(
                lable: "Confirm Password",
                hint: "********",
                isPassword: true,
              ),
              Gap(40),
              Center(
                child: CustomButtom(
                  text: "Submit",
                  height: 50,
                  width: 342,
                  onTap: () => LoginRoute().push(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
