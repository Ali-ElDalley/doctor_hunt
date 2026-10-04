import 'package:doctor_hunt/apps/core/network/error/app_Exception.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/datasources/supabase_data_source.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/auth_request_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/otp_flow.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  final SupabaseDataSource dataSource;
  AuthRepo(this.dataSource);
  Future<AuthResponse> signUp(AuthRequestModel request) async {
    try {
      AuthResponse response = await dataSource.signUp(request);
      return response;
    } on AuthException catch (e) {
      throw AppException(e.message);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<AuthResponse> verifyOtp(
    String email,
    String token,
    OtpFlow flow,
  ) async {
    try {
      AuthResponse response = await dataSource.verifyOtp(email, token, flow);
      return response;
    } on AuthException catch (e) {
      throw AppException(e.message);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await dataSource.forgotPassword(email);
    } on AuthException catch (e) {
      throw AppException(e.message);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<UserResponse> updatePassword(String password) async {
    try {
      UserResponse response = await dataSource.updatePassword(password);
      return response;
    } on AuthException catch (e) {
      throw AppException(e.message);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<AuthResponse> logIn(AuthRequestModel request) async {
    try {
      AuthResponse response = await dataSource.logIn(request);
      return response;
    } on AuthException catch (e) {
      throw AppException(e.message);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<String> getUserRole(String userId) async {
  try {
    return await dataSource.getUserRole(userId);
  } on PostgrestException catch (e) {
    throw AppException(e.message);
  } catch (e) {
    throw AppException(e.toString());
  }
}

Future<void> signOut() async {
  try {
    await dataSource.signOut();
  } catch (e) {
    throw AppException(e.toString());
  }
}
}
