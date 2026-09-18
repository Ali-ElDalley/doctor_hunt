import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/custom_form_field.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding:  EdgeInsets.all(18.w),
          child: Form(
            child: Column(
              children: [
                Center(child: Image.asset(AppImages.logo)),
                Center(
                  child: Text(tr.logIn.title, style: context.bold40Primary),
                ),
                Gap(90),
                CustomFormField(
                  lable: tr.logIn.email,
                  hint: tr.logIn.emailHint,
                  controller: email,
                ),
                Gap(29),
                CustomFormField(
                  lable: tr.logIn.password,
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
                      tr.logIn.forgetPassword,
                      style: context.medium14Primary,
                    ),
                  ),
                ),
                Gap(31),
                CustomButtom(
                  text: tr.logIn.title,
                  height: 50.h,
                  width: 342.w,
                  onTap: () => HomeRoute().push(context),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tr.logIn.noAccount,
                      style: context.semiBold14TextPlaceholder,
                    ),
                    GestureDetector(
                      onTap: () => SignupRoute().push(context),
                      child: Text(
                        tr.logIn.signUp,
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
