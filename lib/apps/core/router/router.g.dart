// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $onboardingRoute,
  $chooseRoleRoute,
  $loginScreenRoute,
  $signupScreenRoute,
  $forgetPasswordScreenRoute,
  $otpScreenRoute,
  $createNewPasswordScreenRoute,
  $doctorDetailsRout,
  $doctorSelectTimeRoute,
  $popularDoctorsRoute,
  $findDoctorsRoute,
  $mainShellRouteData,
];

RouteBase get $onboardingRoute => GoRouteData.$route(
  path: '/onboarding',
  hasOverriddenOnExit: false,
  factory: $OnboardingRoute._fromState,
);

mixin $OnboardingRoute on GoRouteData {
  static OnboardingRoute _fromState(GoRouterState state) =>
      const OnboardingRoute();

  @override
  String get location => GoRouteData.$location('/onboarding');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $chooseRoleRoute => GoRouteData.$route(
  path: '/choose-role',
  hasOverriddenOnExit: false,
  factory: $ChooseRoleRoute._fromState,
);

mixin $ChooseRoleRoute on GoRouteData {
  static ChooseRoleRoute _fromState(GoRouterState state) =>
      const ChooseRoleRoute();

  @override
  String get location => GoRouteData.$location('/choose-role');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginScreenRoute => GoRouteData.$route(
  path: '/login/:role',
  hasOverriddenOnExit: false,
  factory: $LoginScreenRoute._fromState,
);

mixin $LoginScreenRoute on GoRouteData {
  static LoginScreenRoute _fromState(GoRouterState state) =>
      LoginScreenRoute(role: state.pathParameters['role']!);

  LoginScreenRoute get _self => this as LoginScreenRoute;

  @override
  String get location =>
      GoRouteData.$location('/login/${Uri.encodeComponent(_self.role)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signupScreenRoute => GoRouteData.$route(
  path: '/signupScreen',
  hasOverriddenOnExit: false,
  factory: $SignupScreenRoute._fromState,
);

mixin $SignupScreenRoute on GoRouteData {
  static SignupScreenRoute _fromState(GoRouterState state) =>
      const SignupScreenRoute();

  @override
  String get location => GoRouteData.$location('/signupScreen');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $forgetPasswordScreenRoute => GoRouteData.$route(
  path: '/forget-password',
  hasOverriddenOnExit: false,
  factory: $ForgetPasswordScreenRoute._fromState,
);

mixin $ForgetPasswordScreenRoute on GoRouteData {
  static ForgetPasswordScreenRoute _fromState(GoRouterState state) =>
      const ForgetPasswordScreenRoute();

  @override
  String get location => GoRouteData.$location('/forget-password');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $otpScreenRoute => GoRouteData.$route(
  path: '/otp-verification/:email',
  hasOverriddenOnExit: false,
  factory: $OtpScreenRoute._fromState,
);

mixin $OtpScreenRoute on GoRouteData {
  static OtpScreenRoute _fromState(GoRouterState state) => OtpScreenRoute(
    email: state.pathParameters['email']!,
    type: _$OtpFlowEnumMap._$fromName(state.uri.queryParameters['type']!)!,
  );

  OtpScreenRoute get _self => this as OtpScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/otp-verification/${Uri.encodeComponent(_self.email)}',
    queryParams: {'type': _$OtpFlowEnumMap[_self.type]},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

const _$OtpFlowEnumMap = {
  OtpFlow.signUp: 'sign-up',
  OtpFlow.recovery: 'recovery',
};

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}

RouteBase get $createNewPasswordScreenRoute => GoRouteData.$route(
  path: '/create-new-password',
  hasOverriddenOnExit: false,
  factory: $CreateNewPasswordScreenRoute._fromState,
);

mixin $CreateNewPasswordScreenRoute on GoRouteData {
  static CreateNewPasswordScreenRoute _fromState(GoRouterState state) =>
      const CreateNewPasswordScreenRoute();

  @override
  String get location => GoRouteData.$location('/create-new-password');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $doctorDetailsRout => GoRouteData.$route(
  path: '/doctorDetailsScreen',
  hasOverriddenOnExit: false,
  factory: $DoctorDetailsRout._fromState,
);

mixin $DoctorDetailsRout on GoRouteData {
  static DoctorDetailsRout _fromState(GoRouterState state) =>
      DoctorDetailsRout(doctorId: state.uri.queryParameters['doctor-id']!);

  DoctorDetailsRout get _self => this as DoctorDetailsRout;

  @override
  String get location => GoRouteData.$location(
    '/doctorDetailsScreen',
    queryParams: {'doctor-id': _self.doctorId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $doctorSelectTimeRoute => GoRouteData.$route(
  path: '/doctorSelectTimeScreen',
  hasOverriddenOnExit: false,
  factory: $DoctorSelectTimeRoute._fromState,
);

mixin $DoctorSelectTimeRoute on GoRouteData {
  static DoctorSelectTimeRoute _fromState(GoRouterState state) =>
      DoctorSelectTimeRoute(doctorId: state.uri.queryParameters['doctor-id']!);

  DoctorSelectTimeRoute get _self => this as DoctorSelectTimeRoute;

  @override
  String get location => GoRouteData.$location(
    '/doctorSelectTimeScreen',
    queryParams: {'doctor-id': _self.doctorId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $popularDoctorsRoute => GoRouteData.$route(
  path: '/popularDoctorsScreen',
  hasOverriddenOnExit: false,
  factory: $PopularDoctorsRoute._fromState,
);

mixin $PopularDoctorsRoute on GoRouteData {
  static PopularDoctorsRoute _fromState(GoRouterState state) =>
      const PopularDoctorsRoute();

  @override
  String get location => GoRouteData.$location('/popularDoctorsScreen');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $findDoctorsRoute => GoRouteData.$route(
  path: '/findDoctorsScreen',
  hasOverriddenOnExit: false,
  factory: $FindDoctorsRoute._fromState,
);

mixin $FindDoctorsRoute on GoRouteData {
  static FindDoctorsRoute _fromState(GoRouterState state) => FindDoctorsRoute(
    initialQuery: state.uri.queryParameters['initial-query'],
  );

  FindDoctorsRoute get _self => this as FindDoctorsRoute;

  @override
  String get location => GoRouteData.$location(
    '/findDoctorsScreen',
    queryParams: {
      if (_self.initialQuery != null) 'initial-query': _self.initialQuery,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
  factory: $MainShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',
          hasOverriddenOnExit: false,
          factory: $HomeRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/favorites',
          hasOverriddenOnExit: false,
          factory: $FavoritesRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/bookmarks',
          hasOverriddenOnExit: false,
          factory: $BookmarksRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/chat',
          hasOverriddenOnExit: false,
          factory: $ChatRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FavoritesRoute on GoRouteData {
  static FavoritesRoute _fromState(GoRouterState state) =>
      const FavoritesRoute();

  @override
  String get location => GoRouteData.$location('/favorites');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BookmarksRoute on GoRouteData {
  static BookmarksRoute _fromState(GoRouterState state) =>
      const BookmarksRoute();

  @override
  String get location => GoRouteData.$location('/bookmarks');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChatRoute on GoRouteData {
  static ChatRoute _fromState(GoRouterState state) => const ChatRoute();

  @override
  String get location => GoRouteData.$location('/chat');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
