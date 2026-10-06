
import 'package:doctor_hunt/apps/features/common/auth/data/models/otp_flow.dart';
import 'package:doctor_hunt/apps/features/patient/doctor_details/presentation/screens/doctor_details_screen.dart';
import 'package:doctor_hunt/apps/features/patient/doctor_select_time/presentation/screens/doctor_select_time_screen.dart';
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
import 'package:doctor_hunt/apps/features/patient/home/presentation/screens/popular_doctors_screen.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/screens/find_doctors_screen.dart';

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

@TypedGoRoute<LoginScreenRoute>(path: '/login/:role')
class LoginScreenRoute extends GoRouteData with $LoginScreenRoute {
  final String role;
  const LoginScreenRoute({required this.role});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LogInScreen(role: role);
}

@TypedGoRoute<SignupScreenRoute>(path: '/signupScreen')
class SignupScreenRoute extends GoRouteData with $SignupScreenRoute {
  const SignupScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SignupScreen();
}

@TypedGoRoute<ForgetPasswordScreenRoute>(path: '/forget-password')
class ForgetPasswordScreenRoute extends GoRouteData
    with $ForgetPasswordScreenRoute {
  const ForgetPasswordScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ForgetpasswordScreen();
}

@TypedGoRoute<OtpScreenRoute>(path: '/otp-verification/:email')
class OtpScreenRoute extends GoRouteData with $OtpScreenRoute {
  final String email;
  final OtpFlow type;
  const OtpScreenRoute({required this.email, required this.type});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      OtpScreen(email: email, type: type);
}

@TypedGoRoute<CreateNewPasswordScreenRoute>(path: '/create-new-password')
class CreateNewPasswordScreenRoute extends GoRouteData
    with $CreateNewPasswordScreenRoute {
  const CreateNewPasswordScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CreateNewPasswordScreen();
  }
}

@TypedGoRoute<DoctorDetailsRout>(path: '/doctorDetailsScreen')
class DoctorDetailsRout extends GoRouteData with $DoctorDetailsRout {
  final String doctorId;
  DoctorDetailsRout({required this.doctorId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DoctorDetailsScreen(doctorId: doctorId);
}

@TypedGoRoute<DoctorSelectTimeRoute>(path: '/doctorSelectTimeScreen')
class DoctorSelectTimeRoute extends GoRouteData with $DoctorSelectTimeRoute {
  final String doctorId;
  DoctorSelectTimeRoute({required this.doctorId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DoctorSelectTimeScreen(doctorId: doctorId);
}

@TypedGoRoute<PopularDoctorsRoute>(path: '/popularDoctorsScreen')
class PopularDoctorsRoute extends GoRouteData with $PopularDoctorsRoute {
  const PopularDoctorsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PopularDoctorsScreen();
}

@TypedGoRoute<FindDoctorsRoute>(path: '/findDoctorsScreen')
class FindDoctorsRoute extends GoRouteData with $FindDoctorsRoute {
  final String? initialQuery;
  const FindDoctorsRoute({this.initialQuery});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      FindDoctorsScreen(initialQuery: initialQuery);
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
