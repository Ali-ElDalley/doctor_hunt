import 'package:doctor_hunt/apps/features/common/auth/data/models/auth_request_model.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/models/otp_flow.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSource {
  final SupabaseClient _client;
  AuthDataSource(this._client);
  Future<AuthResponse> signUp(AuthRequestModel req) async {
    return await _client.auth.signUp(
      email: req.email,
      password: req.password,
      data: req.data,
    );
  }

  Future<AuthResponse> logIn(AuthRequestModel req) async {
    return await _client.auth.signInWithPassword(
      email: req.email,
      password: req.password,
    );
  }

  Future<AuthResponse> verifyOtp(
    String email,
    String token,
    OtpFlow flow,
  ) async {
    final type = switch (flow) {
      OtpFlow.signUp => OtpType.signup,
      OtpFlow.recovery => OtpType.recovery,
    };
    return await _client.auth.verifyOTP(email: email, token: token, type: type);
  }

  Future<void> forgotPassword(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }

  Future<UserResponse> updatePassword(String password) async {
    return await _client.auth.updateUser(UserAttributes(password: password));
  }

  Future<String> getUserRole(String userId) async {
    final response = await _client
        .from('users')
        .select('role')
        .eq('id', userId)
        .single();
    return response['role'] as String;
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

}
