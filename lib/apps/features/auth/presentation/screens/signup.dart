import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/custom_form_field.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
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
  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phone.dispose();
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
                  Center(child: Text("Sign Up", style: context.bold36Primary)),
                  Gap(71),
                  CustomFormField(
                    controller: firstName,
                    lable: "First Name",
                    hint: " Enter your First Name",
                  ),
                  Gap(16),
                  CustomFormField(
                    controller: lastName,
                    lable: "Last Name",
                    hint: "Enter your Last Name",
                  ),
                  Gap(16),
                  CustomFormField(
                    controller: email,
                    lable: "Email",
                    hint: "Enter your email address",
                  ),
                  Gap(16),
                  CustomFormField(
                    controller: phone,
                    lable: "Phone",
                    hint: "Enter your Phone ",
                  ),
                  Gap(16),
                  CustomFormField(
                    controller: password,
                    lable: "Password",
                    hint: "********",
                    isPassword: true,
                  ),
                  Gap(16),
                  CustomFormField(
                    controller: confirmPassword,
                    lable: "Confirm Password",
                    hint: "********",
                    isPassword: true,
                  ),
                  Gap(28),
                  CustomButtom(
                    text: "Sign Up",
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
                        "Have an account already?  ",
                        style: context.semiBold14TextSub,
                      ),
                      GestureDetector(
                        onTap: () => LoginRoute().push(context),
                        child: Text(
                          "Log in",
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
