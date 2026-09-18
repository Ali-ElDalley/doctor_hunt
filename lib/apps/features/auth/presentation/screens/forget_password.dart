import 'package:doctor_hunt/apps/core/extensions/text_editing_controller_ex.dart';
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

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AuthAppBar(text: tr.forgetPassword.back),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr.forgetPassword.title, style: context.bold28Primary),
              Gap(6),
              Text(tr.forgetPassword.sub, style: context.light20TextSub),
              Gap(70),
              CustomFormField(
                lable: tr.forgetPassword.email,
                hint: tr.forgetPassword.emailHint,
                controller: email,
              ),
              Gap(55),
              Center(
                child: CustomButtom(
                  text: tr.forgetPassword.sendCode,
                  height: 50.h,
                  width: 342.w,
                  onTap: () =>
                      OtpVerficationRoute(email: email.getText).push(context),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
