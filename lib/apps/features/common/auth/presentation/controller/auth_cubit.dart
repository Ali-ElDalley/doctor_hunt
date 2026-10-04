import 'dart:developer';

import 'package:doctor_hunt/apps/core/network/error/app_exception.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/otp_flow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';
import '../../data/repo/auth_repo.dart';
import '../../data/models/auth_request_model.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(const AuthInitial());

  Future<void> signUp(AuthRequestModel request) async {
    emit(const AuthLoading());
    try {
      await authRepo.signUp(request);
      emit(const AuthSuccess());
    } on AppException catch (e) {
      emit(AuthFailure(e.message));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> verifyOtp(String email, String code, OtpFlow flow) async {
    emit(const AuthLoading());
    try {
      await authRepo.verifyOtp(email, code, flow);
      emit(const AuthSuccess());
    } on AppException catch (e) {
      emit(AuthFailure(e.message));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> forgotPassword(String email) async {
    emit(const AuthLoading());
    try {
      await authRepo.forgotPassword(email);
      emit(const AuthSuccess());
    } on AppException catch (e) {
      emit(AuthFailure(e.message));
    }
  }

  Future<void> updatePassword(String password) async {
    emit(const AuthLoading());
    try {
      await authRepo.updatePassword(password);
      emit(const AuthSuccess());
    } on AppException catch (e) {
      emit(AuthFailure(e.message));
    }
  }

  Future<void> logIn(AuthRequestModel request, String expectedRole) async {
    emit(const AuthLoading());
    log("expectedRole : $expectedRole");

    try {
      final response = await authRepo.logIn(request);
      final userId = response.user!.id;
      log("*********************");
      log("userId : $userId");
      final actualRole = await authRepo.getUserRole(userId);
      log("actualRole : $actualRole");
      log("*********************");

      if (actualRole != expectedRole) {
        log("if state");
        await authRepo.signOut();
        emit(const AuthFailure("Account doesn't match"));
        return;
      }

      emit(const AuthSuccess());
    } on AppException catch (e) {
      log('catch AppException');
      emit(AuthFailure(e.message));
    } catch (e) {
      log('catch');
      emit(AuthFailure(e.toString()));
    }
  }
}
