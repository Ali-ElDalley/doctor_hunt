import 'package:doctor_hunt/apps/features/patient/doctor_details/presentation/screens/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Onboarding
import 'package:doctor_hunt/apps/features/common/onboarding/presentation/screens/onboarding_screen.dart';

// Choose Role
import 'package:doctor_hunt/apps/features/common/choose_role/presentation/screens/choose_role_screen.dart';

// Auth
import 'package:doctor_hunt/apps/features/common/auth/presentation/screens/login.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/screens/signup.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/screens/forget_password.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/screens/otp_verfication.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/screens/create_new_password.dart';

// Home
import 'package:doctor_hunt/apps/features/patient/home/presentation/screens/home_screen.dart';

// Root
import 'package:doctor_hunt/apps/features/patient/main/presentation/screens/root.dart';

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

@TypedGoRoute<DoctorDetailsRout>(path: '/doctorDetailsScreen')
class DoctorDetailsRout extends GoRouteData with $DoctorDetailsRout {
  final String doctorId;
   DoctorDetailsRout({required this.doctorId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
       DoctorDetailsScreen(doctorId: doctorId,);
}

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: [
    TypedStatefulShellBranch<HomeBranchData>(
      routes: [TypedGoRoute<HomeRoute>(path: '/home')],
    ),
    TypedStatefulShellBranch<FavoritesBranchData>(
      routes: [TypedGoRoute<FavoritesRoute>(path: '/favorites')],
    ),
    TypedStatefulShellBranch<BookmarksBranchData>(
      routes: [TypedGoRoute<BookmarksRoute>(path: '/bookmarks')],
    ),
    TypedStatefulShellBranch<ChatBranchData>(
      routes: [TypedGoRoute<ChatRoute>(path: '/chat')],
    ),
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return Root(navigationShell: navigationShell);
  }
}

class HomeBranchData extends StatefulShellBranchData {
  const HomeBranchData();
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class FavoritesBranchData extends StatefulShellBranchData {
  const FavoritesBranchData();
}

class FavoritesRoute extends GoRouteData with $FavoritesRoute {
  const FavoritesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Placeholder();
}

class BookmarksBranchData extends StatefulShellBranchData {
  const BookmarksBranchData();
}

class BookmarksRoute extends GoRouteData with $BookmarksRoute {
  const BookmarksRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Placeholder();
}

class ChatBranchData extends StatefulShellBranchData {
  const ChatBranchData();
}

class ChatRoute extends GoRouteData with $ChatRoute {
  const ChatRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Placeholder();
}

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: $appRoutes,
);
