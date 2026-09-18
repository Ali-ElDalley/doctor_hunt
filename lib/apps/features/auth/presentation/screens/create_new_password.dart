import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/auth_app_bar.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/custom_form_field.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AuthAppBar(text: tr.createNewPassword.cancel),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              Text(tr.createNewPassword.title, style: context.bold28Primary),
              Gap(12),
              CustomFormField(
                lable: tr.createNewPassword.password,
                hint: "********",
                isPassword: true,
              ),
              Gap(16),
              CustomFormField(
                lable: tr.createNewPassword.confirmPassword,
                hint: "********",
                isPassword: true,
              ),
              Gap(40),
              Center(
                child: CustomButtom(
                  text: tr.createNewPassword.button,
                  height: 50.h,
                  width: 342.w,
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
