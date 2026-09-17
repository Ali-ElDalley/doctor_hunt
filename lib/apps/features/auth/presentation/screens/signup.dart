import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/custom_form_field.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:image_picker/image_picker.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  XFile? image;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: Image.asset(AppImages.logo)),
                  Center(child: Text(tr.signUp.title, style: context.bold36Primary)),
                  Gap(71),
                  CustomFormField(
                    controller: name,
                    lable: tr.signUp.name,
                    hint: tr.signUp.nameHint,
                  ),
                  Gap(16),
                  CustomFormField(
                    controller: email,
                    lable: tr.signUp.email,
                    hint: tr.signUp.emailHint,
                  ),
                
                  Gap(16),
                  CustomFormField(
                    controller: password,
                    lable: tr.signUp.password,
                    hint: tr.signUp.passwordHint,
                    isPassword: true,
                  ),
                  Gap(16),
                  CustomFormField(
                    controller: confirmPassword,
                    lable: tr.signUp.confirmPassword,
                    hint: tr.signUp.confirmPasswordHint,
                    isPassword: true,
                  ),
                  Gap(28),
                  CustomButtom(
                    text: tr.signUp.button,
                    height: 50,
                    width: 342,
                    onTap: () {
                      LoginRoute().push(context);
                    },
                  ),
                  Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tr.signUp.haveAccount,
                        style: context.semiBold14TextSub,
                      ),
                      GestureDetector(
                        onTap: () => LoginRoute().push(context),
                        child: Text(
                          tr.signUp.logIn,
                          style: context.semiBold14PrimaryDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
