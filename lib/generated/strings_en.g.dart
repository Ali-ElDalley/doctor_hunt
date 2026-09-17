///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final tr = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$onboarding$en onboarding = Translations$onboarding$en._(_root);
	late final Translations$chooseRole$en chooseRole = Translations$chooseRole$en._(_root);
	late final Translations$logIn$en logIn = Translations$logIn$en._(_root);
	late final Translations$signUp$en signUp = Translations$signUp$en._(_root);
	late final Translations$forgetPassword$en forgetPassword = Translations$forgetPassword$en._(_root);
	late final Translations$otpVerification$en otpVerification = Translations$otpVerification$en._(_root);
	late final Translations$createNewPassword$en createNewPassword = Translations$createNewPassword$en._(_root);
	late final Translations$home$en home = Translations$home$en._(_root);
	late final Translations$doctorDetails$en doctorDetails = Translations$doctorDetails$en._(_root);
}

// Path: onboarding
class Translations$onboarding$en {
	Translations$onboarding$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Get Started'
	String get getStarted => 'Get Started';

	late final Translations$onboarding$onboarding1$en onboarding1 = Translations$onboarding$onboarding1$en._(_root);
	late final Translations$onboarding$onboarding2$en onboarding2 = Translations$onboarding$onboarding2$en._(_root);
	late final Translations$onboarding$onboarding3$en onboarding3 = Translations$onboarding$onboarding3$en._(_root);
}

// Path: chooseRole
class Translations$chooseRole$en {
	Translations$chooseRole$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue'
	String get button => 'Continue';

	/// en: 'Choose your role'
	String get title => 'Choose your role';

	/// en: 'The selected role determines the experience and available features'
	String get sub => 'The selected role determines the experience and available features';

	late final Translations$chooseRole$patient$en patient = Translations$chooseRole$patient$en._(_root);
	late final Translations$chooseRole$admin$en admin = Translations$chooseRole$admin$en._(_root);
}

// Path: logIn
class Translations$logIn$en {
	Translations$logIn$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Log In'
	String get title => 'Log In';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Enter your email address'
	String get emailHint => 'Enter your email address';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Forget Password...?'
	String get forgetPassword => 'Forget Password...?';

	/// en: 'Log In'
	String get button => 'Log In';

	/// en: 'Don’t have an account'
	String get noAccount => 'Don’t have an account';

	/// en: 'Sign Up now'
	String get signUp => 'Sign Up now';
}

// Path: signUp
class Translations$signUp$en {
	Translations$signUp$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sign Up'
	String get title => 'Sign Up';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Enter your full name'
	String get nameHint => 'Enter your full name';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Enter your email address'
	String get emailHint => 'Enter your email address';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Enter your password'
	String get passwordHint => 'Enter your password';

	/// en: 'Confirm Password'
	String get confirmPassword => 'Confirm Password';

	/// en: 'Re-enter your password'
	String get confirmPasswordHint => 'Re-enter your password';

	/// en: 'Sign Up'
	String get button => 'Sign Up';

	/// en: 'Already have an account?'
	String get haveAccount => 'Already have an account?';

	/// en: 'Log In'
	String get logIn => 'Log In';
}

// Path: forgetPassword
class Translations$forgetPassword$en {
	Translations$forgetPassword$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Forget Your Password ?'
	String get title => 'Forget Your Password ?';

	/// en: 'Please enter the email address associated with your account. We will send you an OTP to reset your password.'
	String get sub => 'Please enter the email address associated with your account. We will send you an OTP to reset your password.';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Enter your email address'
	String get emailHint => 'Enter your email address';

	/// en: 'Send Code'
	String get sendCode => 'Send Code';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Send Code'
	String get button => 'Send Code';
}

// Path: otpVerification
class Translations$otpVerification$en {
	Translations$otpVerification$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'OTP Verification'
	String get title => 'OTP Verification';

	/// en: 'Please enter the 5-digit code sent to your email address.'
	String get sub => 'Please enter the 5-digit code sent to your email address.';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Verify'
	String get button => 'Verify';
}

// Path: createNewPassword
class Translations$createNewPassword$en {
	Translations$createNewPassword$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Create New Password'
	String get title => 'Create New Password';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Confirm Password'
	String get confirmPassword => 'Confirm Password';

	/// en: 'Re-enter your password'
	String get confirmPasswordHint => 'Re-enter your password';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Submit'
	String get button => 'Submit';
}

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi, {name}!'
	String get greeting => 'Hi, {name}!';

	/// en: 'Find Your Doctor'
	String get title => 'Find Your Doctor';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Live Doctors'
	String get liveDoctors => 'Live Doctors';

	/// en: 'Popular Doctor'
	String get popularDoctors => 'Popular Doctor';

	/// en: 'Feature Doctor'
	String get featureDoctors => 'Feature Doctor';

	/// en: 'View All'
	String get viewAll => 'View All';
}

// Path: doctorDetails
class Translations$doctorDetails$en {
	Translations$doctorDetails$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Doctor Details'
	String get title => 'Doctor Details';

	/// en: 'Running'
	String get running => 'Running';

	/// en: 'Ongoing'
	String get ongoing => 'Ongoing';

	/// en: 'Patient'
	String get patient => 'Patient';

	/// en: 'Services'
	String get services => 'Services';

	/// en: '/Hour'
	String get hour => '/Hour';

	/// en: 'Book Now'
	String get bookNow => 'Book Now';
}

// Path: onboarding.onboarding1
class Translations$onboarding$onboarding1$en {
	Translations$onboarding$onboarding1$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Find Trusted Doctors'
	String get title => 'Find Trusted Doctors';

	/// en: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'
	String get sub => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.';
}

// Path: onboarding.onboarding2
class Translations$onboarding$onboarding2$en {
	Translations$onboarding$onboarding2$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose Best Doctors'
	String get title => 'Choose Best Doctors';

	/// en: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'
	String get sub => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.';
}

// Path: onboarding.onboarding3
class Translations$onboarding$onboarding3$en {
	Translations$onboarding$onboarding3$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Easy Appointments'
	String get title => 'Easy Appointments';

	/// en: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'
	String get sub => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.';
}

// Path: chooseRole.patient
class Translations$chooseRole$patient$en {
	Translations$chooseRole$patient$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Patient'
	String get title => 'Patient';

	/// en: 'Find doctors, book appointments, and manage your medical records.'
	String get sub => 'Find doctors, book appointments, and manage your medical records.';
}

// Path: chooseRole.admin
class Translations$chooseRole$admin$en {
	Translations$chooseRole$admin$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Admin'
	String get title => 'Admin';

	/// en: 'Manage doctors, appointments, users, and the platform.'
	String get sub => 'Manage doctors, appointments, users, and the platform.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'onboarding.next' => 'Next',
			'onboarding.skip' => 'Skip',
			'onboarding.getStarted' => 'Get Started',
			'onboarding.onboarding1.title' => 'Find Trusted Doctors',
			'onboarding.onboarding1.sub' => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
			'onboarding.onboarding2.title' => 'Choose Best Doctors',
			'onboarding.onboarding2.sub' => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
			'onboarding.onboarding3.title' => 'Easy Appointments',
			'onboarding.onboarding3.sub' => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
			'chooseRole.button' => 'Continue',
			'chooseRole.title' => 'Choose your role',
			'chooseRole.sub' => 'The selected role determines the experience and available features',
			'chooseRole.patient.title' => 'Patient',
			'chooseRole.patient.sub' => 'Find doctors, book appointments, and manage your medical records.',
			'chooseRole.admin.title' => 'Admin',
			'chooseRole.admin.sub' => 'Manage doctors, appointments, users, and the platform.',
			'logIn.title' => 'Log In',
			'logIn.email' => 'Email',
			'logIn.emailHint' => 'Enter your email address',
			'logIn.password' => 'Password',
			'logIn.forgetPassword' => 'Forget Password...?',
			'logIn.button' => 'Log In',
			'logIn.noAccount' => 'Don’t have an account',
			'logIn.signUp' => 'Sign Up now',
			'signUp.title' => 'Sign Up',
			'signUp.name' => 'Name',
			'signUp.nameHint' => 'Enter your full name',
			'signUp.email' => 'Email',
			'signUp.emailHint' => 'Enter your email address',
			'signUp.password' => 'Password',
			'signUp.passwordHint' => 'Enter your password',
			'signUp.confirmPassword' => 'Confirm Password',
			'signUp.confirmPasswordHint' => 'Re-enter your password',
			'signUp.button' => 'Sign Up',
			'signUp.haveAccount' => 'Already have an account?',
			'signUp.logIn' => 'Log In',
			'forgetPassword.title' => 'Forget Your Password ?',
			'forgetPassword.sub' => 'Please enter the email address associated with your account. We will send you an OTP to reset your password.',
			'forgetPassword.email' => 'Email',
			'forgetPassword.emailHint' => 'Enter your email address',
			'forgetPassword.sendCode' => 'Send Code',
			'forgetPassword.back' => 'Back',
			'forgetPassword.button' => 'Send Code',
			'otpVerification.title' => 'OTP Verification',
			'otpVerification.sub' => 'Please enter the 5-digit code sent to your email address.',
			'otpVerification.cancel' => 'Cancel',
			'otpVerification.button' => 'Verify',
			'createNewPassword.title' => 'Create New Password',
			'createNewPassword.password' => 'Password',
			'createNewPassword.confirmPassword' => 'Confirm Password',
			'createNewPassword.confirmPasswordHint' => 'Re-enter your password',
			'createNewPassword.cancel' => 'Cancel',
			'createNewPassword.button' => 'Submit',
			'home.greeting' => 'Hi, {name}!',
			'home.title' => 'Find Your Doctor',
			'home.search' => 'Search',
			'home.liveDoctors' => 'Live Doctors',
			'home.popularDoctors' => 'Popular Doctor',
			'home.featureDoctors' => 'Feature Doctor',
			'home.viewAll' => 'View All',
			'doctorDetails.title' => 'Doctor Details',
			'doctorDetails.running' => 'Running',
			'doctorDetails.ongoing' => 'Ongoing',
			'doctorDetails.patient' => 'Patient',
			'doctorDetails.services' => 'Services',
			'doctorDetails.hour' => '/Hour',
			'doctorDetails.bookNow' => 'Book Now',
			_ => null,
		};
	}
}
