import 'dart:developer';

import 'package:doctor_hunt/apps/core/extensions/build_context_ex.dart';
import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/extensions/text_editing_controller_ex.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/controller/auth_state.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/widget/auth_app_bar.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_form_field.dart';
import 'package:doctor_hunt/apps/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AuthAppBar(text: tr.createNewPassword.cancel),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: BlocConsumer<AuthCubit, AuthCubitState>(
            listener: (context, state) {
              log(state.toString());
              if (state is AuthSuccess) {
                LoginScreenRoute(role: "patient").go(context);
              } else if (state is AuthFailure) {
                context.showSnackBar(state.message);
              }
            },
            builder: (context, state) => Form(
              key: _formKey,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(30),
                        Text(
                          tr.createNewPassword.title,
                          style: context.bold28Primary,
                        ),
                        Gap(12),
                        CustomFormField(
                          lable: tr.createNewPassword.password,
                          hint: "********",
                          isPassword: true,
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            }
                            return null;
                          },
                        ),
                        Gap(16),
                        CustomFormField(
                          lable: tr.createNewPassword.confirmPassword,
                          hint: "********",
                          isPassword: true,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter confirm password";
                            }
                            if (value != passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                        Gap(40),
                        Center(
                          child: state is AuthLoading
                              ? const CircularProgressIndicator()
                              : AppButton(
                                  text: tr.createNewPassword.button,
                                  height: 50.h,
                                  width: 342.w,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.updatePassword(
                                        passwordController.getText,
                                      );
                                    }
                                  },
                                ),
                        ),
                      ],
                    ),
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

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.authRepo),
      child: const CreateNewPassword(),
    );
  }
}
