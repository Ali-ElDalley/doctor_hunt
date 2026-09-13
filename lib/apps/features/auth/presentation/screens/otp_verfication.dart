import 'package:doctor_hunt/apps/core/router/router.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/auth_app_bar.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widget/custom_pin_put.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_buttom.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class OtpVerfication extends StatefulWidget {
  final String email;
  const OtpVerfication({super.key, required this.email});

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
    return Scaffold(
      appBar: AuthAppBar(text: "Cancel"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "OTP Verfication",
               style: context.bold28Primary,

              ),
              Gap(6),
              Text(
                "Please enter the 4 digit code sent your phone number",
                style: context.medium24TextSub,
              ),
              Gap(50),
              CustomPinPut(controller: pinPut),
              Gap(80),
              Center(
                child: CustomButtom(
                  text: "Send  Code",
                  onTap: ()=>CreateNewPasswordRoute().go(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
