
import 'package:doctor_hunt/apps/core/extensions/build_context_ex.dart';
import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/extensions/text_editing_controller_ex.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/otp_flow.dart';
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

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AuthAppBar(text: tr.forgetPassword.back),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Form(
            key: formKey,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: BlocConsumer<AuthCubit, AuthCubitState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) => OtpScreenRoute(
                            email: email.getText,
                            type: OtpFlow.recovery,
                          ).push(context),
                        );
                      } else if (state is AuthFailure) {
                        context.showSnackBar(state.message);
                      }
                    },
                    builder: (context, state) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.forgetPassword.title,
                          style: context.bold28Primary,
                        ),
                        Gap(6),
                        Text(
                          tr.forgetPassword.sub,
                          style: context.light20TextSub,
                        ),
                        Gap(70),
                        CustomFormField(
                          lable: tr.forgetPassword.email,
                          hint: tr.forgetPassword.emailHint,
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return tr.forgetPassword.required;
                            }
                            if (!value.contains('@')) {
                              return tr.forgetPassword.invalid;
                            }
                            return null;
                          },
                        ),
                        Gap(55),
                        Center(
                          child: state is AuthLoading
                              ? const CircularProgressIndicator()
                              : AppButton(
                                  text: tr.forgetPassword.sendCode,
                                  height: 50.h,
                                  width: 342.w,
                                  onTap: () {
                                    if (!formKey.currentState!.validate()) {
                                      return;
                                    }
                                    context.recoveryPassword(email.getText);
                                  },
                                ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetpasswordScreen extends StatelessWidget {
  const ForgetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.authRepo),
      child: const ForgetPassword(),
    );
  }
}
