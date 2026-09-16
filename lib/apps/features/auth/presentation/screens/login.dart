import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/custom_form_field.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            child: Column(
              children: [
                Center(child: Image.asset(AppImages.logo)),
                Center(child: Text("Log In", style: context.bold40Primary)),
                Gap(90),
                CustomFormField(
                  lable: "Email",
                  hint: "Enter your email address",
                  controller: email,
                ),
                Gap(29),
                CustomFormField(
                  lable: "Password",
                  hint: "********",
                  controller: password,
                  isPassword: true,
                ),
                Gap(4),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: GestureDetector(
                    onTap: () => ForgetPasswordRoute().push(context),
                    child: Text(
                      "Forget Password....?",
                      style: context.medium14Primary,
                    ),
                  ),
                ),
                Gap(31),
                CustomButtom(
                  text: "Log In",
                  height: 50,
                  width: 342,
                  onTap: () => HomeRoute().push(context),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do not have an account? ",
                      style: context.semiBold14TextPlaceholder,
                    ),
                    GestureDetector(
                      onTap: () => SignupRoute().push(context),
                      child: Text(
                        "Sign up now",
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
    );
  }
}
