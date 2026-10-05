import 'package:doctor_hunt/apps/core/extensions/build_context_ex.dart';
import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_form_field.dart';
import 'package:doctor_hunt/apps/core/widgets/app_button.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/auth_request_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/controller/auth_state.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';

class Login extends StatefulWidget {
  final String role;
  const Login({super.key, required this.role});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
          padding: EdgeInsets.all(18.w),
          child: BlocConsumer<AuthCubit, AuthCubitState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                if (widget.role == 'admin') {
                  HomeRoute().go(context);
                } else {
                  HomeRoute().go(context);
                }
              } else if (state is AuthFailure) {
                context.showSnackBar(state.message);
              }
            },
            builder: (context, state) => Form(
              key: formKey,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Center(child: Image.asset(AppImages.logo)),
                        Center(
                          child: Text(
                            tr.logIn.title,
                            style: context.bold40Primary,
                          ),
                        ),
                        Gap(90),
                        CustomFormField(
                          lable: tr.logIn.email,
                          hint: tr.logIn.emailHint,
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return tr.logIn.emailHint;
                            }
                            if (!value.contains("@")) {
                              return "Please Enter Valid Email";
                            }
                            return null;
                          },
                        ),
                        Gap(29),
                        CustomFormField(
                          lable: tr.logIn.password,
                          hint: "********",
                          controller: password,
                          isPassword: true,
                        ),
                        Gap(4),
                        widget.role == "patient"
                            ? Align(
                                alignment: AlignmentGeometry.centerRight,
                                child: GestureDetector(
                                  onTap: () =>
                                      ForgetPasswordScreenRoute().push(context),
                                  child: Text(
                                    tr.logIn.forgetPassword,
                                    style: context.medium14Primary,
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                        Gap(31),
                        state is AuthLoading
                            ? const Center(child: CircularProgressIndicator())
                            : AppButton(
                                text: tr.logIn.title,
                                height: 50.h,
                                width: 342.w,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    context.login(
                                      AuthRequestModel(
                                        email: email.text,
                                        password: password.text,
                                      ),
                                      widget.role,
                                    );
                                  }
                                },
                              ),
                        Spacer(),
                        widget.role == "patient" || state is! AuthLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    tr.logIn.noAccount,
                                    style: context.semiBold14TextPlaceholder,
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        SignupScreenRoute().push(context),
                                    child: Text(
                                      tr.logIn.signUp,
                                      style: context.semiBold14PrimaryDark,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
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

class LogInScreen extends StatelessWidget {
  final String role;
  const LogInScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.authRepo),
      child: Login(role: role),
    );
  }
}
