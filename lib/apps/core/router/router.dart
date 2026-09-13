import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Onboarding
import 'package:doctor_hunt/apps/features/onboarding/presentation/screens/onboarding_screen.dart';

// Choose Role
import 'package:doctor_hunt/apps/features/auth/presentation/screens/choose_role_screen.dart';

// Auth
import 'package:doctor_hunt/apps/features/auth/presentation/screens/login.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/screens/signup.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/screens/forget_password.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/screens/otp_verfication.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/screens/create_new_password.dart';

part 'router.g.dart';

@TypedGoRoute<OnboardingRoute>(path: '/onboarding')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingScreen();
}

@TypedGoRoute<ChooseRoleRoute>(path: '/choose-role')
class ChooseRoleRoute extends GoRouteData with $ChooseRoleRoute {
  const ChooseRoleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ChooseRoleScreen();
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const Login();
}

@TypedGoRoute<SignupRoute>(path: '/signup')
class SignupRoute extends GoRouteData with $SignupRoute {
  const SignupRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const Signup();
}

@TypedGoRoute<ForgetPasswordRoute>(path: '/forget-password')
class ForgetPasswordRoute extends GoRouteData with $ForgetPasswordRoute {
  const ForgetPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ForgetPassword();
}

@TypedGoRoute<OtpVerficationRoute>(path: '/otp-verification')
class OtpVerficationRoute extends GoRouteData with $OtpVerficationRoute {
  final String email;
  const OtpVerficationRoute({required this.email});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      OtpVerfication(email: email);
}

@TypedGoRoute<CreateNewPasswordRoute>(path: '/create-new-password')
class CreateNewPasswordRoute extends GoRouteData with $CreateNewPasswordRoute {
  const CreateNewPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CreateNewPassword();
}

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: $appRoutes,
);