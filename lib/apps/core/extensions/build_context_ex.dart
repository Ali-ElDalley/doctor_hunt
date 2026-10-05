import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/otp_flow.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/auth_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

extension BuildContextExtension on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.danger),
    );
  }

  Future<void> signUp(AuthRequestModel request) async {
    return await read<AuthCubit>().signUp(request);
  }

  Future<void> recoveryPassword(String email) async {
    return await read<AuthCubit>().forgotPassword(email);
  }

  Future<void> verifyOtp(String email, String code, OtpFlow type) async {
    return await read<AuthCubit>().verifyOtp(email, code, type);
  }

  Future<void> updatePassword(String password) async {
    return await read<AuthCubit>().updatePassword(password);
  }

  Future<void> login(AuthRequestModel request, String role) async {
    return await read<AuthCubit>().logIn(request, role);
  }

  Future<void> signOut() async {
    return await read<AuthCubit>().signOut();
  }

  void toggleDrawer() => ZoomDrawer.of(this)?.toggle();
  void closeDrawer() => ZoomDrawer.of(this)?.close();
  void openDrawer() => ZoomDrawer.of(this)?.open();
  bool get isDrawerOpen => ZoomDrawer.of(this)?.isOpen() ?? false;
}
