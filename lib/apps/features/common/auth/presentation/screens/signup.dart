import 'package:doctor_hunt/apps/core/extensions/build_context_ex.dart';
import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/extensions/text_editing_controller_ex.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/auth_request_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/otp_flow.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/controller/auth_state.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_form_field.dart';
import 'package:doctor_hunt/apps/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.w),
          child: BlocConsumer<AuthCubit, AuthCubitState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => OtpScreenRoute(
                    email: email.getText,
                    type: OtpFlow.signUp,
                  ).push(context),
                );
              } else if (state is AuthFailure) {
                context.showSnackBar(state.message);
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(child: Image.asset(AppImages.logo)),
                      Center(
                        child: Text(
                          tr.signUp.title,
                          style: context.bold36Primary,
                        ),
                      ),
                      Gap(71),
                      CustomFormField(
                        controller: name,
                        lable: tr.signUp.name,
                        hint: tr.signUp.nameHint,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return tr.signUp.nameHint;
                          }
                          return null;
                        },
                      ),
                      Gap(16),
                      CustomFormField(
                        controller: email,
                        lable: tr.signUp.email,
                        hint: tr.signUp.emailHint,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return tr.signUp.emailHint;
                          }
                          return null;
                        },
                      ),

                      Gap(16),
                      CustomFormField(
                        controller: password,
                        lable: tr.signUp.password,
                        hint: tr.signUp.passwordHint,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return tr.signUp.passwordHint;
                          } else if (value.length < 8) {
                            return tr.signUp.passwordLength;
                          }
                          return null;
                        },
                      ),
                      Gap(28),
                      state is AuthLoading
                          ? const CircularProgressIndicator()
                          : AppButton(
                              text: tr.signUp.button,
                              height: 50.h,
                              width: 342.w,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  AuthRequestModel request =
                                      AuthRequestModel.signUp(
                                        email: email.getText,
                                        password: password.getText,
                                        name: name.getText,
                                      );
                                  await context.signUp(request);
                                }
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
                            onTap: () =>
                                LoginScreenRoute(role: "patient").go(context),
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
              );
            },
          ),
        ),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.authRepo),
      child: SignupView(),
    );
  }
}
