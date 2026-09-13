import 'package:doctor_hunt/apps/core/extensions/text_editing_controller_ex.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/auth_app_bar.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/custom_form_field.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AuthAppBar(text: "Back"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forget Your Password ?", style: context.bold28Primary),
              Gap(6),
              Text(
                "Please enter the email address associated with your account, and we'll send you OTP to reset your password.",
                style: context.light20TextSub,
              ),
              Gap(70),
              CustomFormField(lable: "Email", hint: "Enter your email address",controller: email,),
              Gap(55),
              Center(
                child: CustomButtom(
                  text: "Send  Code",
                  onTap: () => OtpVerficationRoute(email: email.getText).go(context),
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
