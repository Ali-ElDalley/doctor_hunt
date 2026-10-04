
import 'package:doctor_hunt/apps/core/extensions/build_context_ex.dart';
import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/apps/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/otp_flow.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/controller/auth_state.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/widget/auth_app_bar.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/widget/custom_pin_put.dart';
import 'package:doctor_hunt/apps/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';

class OtpVerfication extends StatefulWidget {
  final String email;
  final OtpFlow flow;
  const OtpVerfication({super.key, required this.email, required this.flow});

  @override
  State<OtpVerfication> createState() => _OtpVerficationState();
}

class _OtpVerficationState extends State<OtpVerfication> {
  final TextEditingController pinPut = TextEditingController();

  @override
  void dispose() {
    pinPut.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AuthAppBar(text: tr.otpVerification.cancel),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: BlocConsumer<AuthCubit, AuthCubitState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                if (widget.flow == OtpFlow.recovery) {
                  CreateNewPasswordScreenRoute().push(context);
                } else {
                  LoginScreenRoute(role: "patient").go(context);
                }
              } else if (state is AuthFailure) {
                context.showSnackBar(state.message);
              }
            },
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr.otpVerification.title, style: context.bold28Primary),
                Gap(6),
                Text(tr.otpVerification.sub, style: context.medium24TextSub),
                Gap(50),
                CustomPinPut(
                  onCompleted: (value) {
                    context.verifyOtp(widget.email, value, widget.flow);
                  },
                ),
                Gap(80),
                Center(
                  child: state is AuthLoading
                      ? const CircularProgressIndicator()
                      : AppButton(
                          text: tr.otpVerification.button,
                          height: 50.h,
                          width: 342.w,
                          isClickable: pinPut.text.length == 6,
                          onTap: () {
                            context.verifyOtp(
                              widget.email,
                              pinPut.text,
                              widget.flow,
                            );
                          },
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

class OtpScreen extends StatelessWidget {
  final String email;
  final OtpFlow type;
  const OtpScreen({super.key, required this.email, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.authRepo),
      child: OtpVerfication(email: email, flow: type),
    );
  }
}
