import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class CustomPinPut extends StatefulWidget {
  final TextEditingController? controller;
  const CustomPinPut({super.key, this.controller});

  @override
  State<CustomPinPut> createState() => _CustomPinPutState();
}

class _CustomPinPutState extends State<CustomPinPut> {
  final PinTheme defaultPinTheme = PinTheme(
    height: 70.h,
    width: 70.w,
    textStyle: TextStyle(fontSize: 24, color: AppColors.primary),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 190, 223, 219),
      borderRadius: BorderRadius.circular(16.r),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 5,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      controller: widget.controller,
      autofocus: true,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: AppColors.primary, width: 2),
        ),
        textStyle: defaultPinTheme.textStyle!.copyWith(fontSize: 28),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: Colors.red, width: 2),
        ),
        textStyle: defaultPinTheme.textStyle!.copyWith(color: Colors.red),
      ),
    );
  }
}
