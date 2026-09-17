///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$onboarding$ar onboarding = _Translations$onboarding$ar._(_root);
	@override late final _Translations$chooseRole$ar chooseRole = _Translations$chooseRole$ar._(_root);
	@override late final _Translations$logIn$ar logIn = _Translations$logIn$ar._(_root);
	@override late final _Translations$signUp$ar signUp = _Translations$signUp$ar._(_root);
	@override late final _Translations$forgetPassword$ar forgetPassword = _Translations$forgetPassword$ar._(_root);
	@override late final _Translations$otpVerification$ar otpVerification = _Translations$otpVerification$ar._(_root);
	@override late final _Translations$createNewPassword$ar createNewPassword = _Translations$createNewPassword$ar._(_root);
	@override late final _Translations$home$ar home = _Translations$home$ar._(_root);
	@override late final _Translations$doctorDetails$ar doctorDetails = _Translations$doctorDetails$ar._(_root);
}

// Path: onboarding
class _Translations$onboarding$ar implements Translations$onboarding$en {
	_Translations$onboarding$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get next => 'التالي';
	@override String get skip => 'تخطي';
	@override String get getStarted => 'ابدأ الآن';
	@override late final _Translations$onboarding$onboarding1$ar onboarding1 = _Translations$onboarding$onboarding1$ar._(_root);
	@override late final _Translations$onboarding$onboarding2$ar onboarding2 = _Translations$onboarding$onboarding2$ar._(_root);
	@override late final _Translations$onboarding$onboarding3$ar onboarding3 = _Translations$onboarding$onboarding3$ar._(_root);
}

// Path: chooseRole
class _Translations$chooseRole$ar implements Translations$chooseRole$en {
	_Translations$chooseRole$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get button => 'متابعة';
	@override String get title => 'اختر دورك';
	@override String get sub => 'يحدد الدور المختار التجربة والميزات المتاحة';
	@override late final _Translations$chooseRole$patient$ar patient = _Translations$chooseRole$patient$ar._(_root);
	@override late final _Translations$chooseRole$admin$ar admin = _Translations$chooseRole$admin$ar._(_root);
}

// Path: logIn
class _Translations$logIn$ar implements Translations$logIn$en {
	_Translations$logIn$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تسجيل الدخول';
	@override String get email => 'البريد الإلكتروني';
	@override String get emailHint => 'أدخل بريدك الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get forgetPassword => 'هل نسيت كلمة المرور؟';
	@override String get button => 'تسجيل الدخول';
	@override String get noAccount => 'ليس لديك حساب؟';
	@override String get signUp => 'سجل الآن';
}

// Path: signUp
class _Translations$signUp$ar implements Translations$signUp$en {
	_Translations$signUp$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إنشاء حساب';
	@override String get name => 'الاسم';
	@override String get nameHint => 'أدخل اسمك الكامل';
	@override String get email => 'البريد الإلكتروني';
	@override String get emailHint => 'أدخل بريدك الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get passwordHint => 'أدخل كلمة المرور';
	@override String get confirmPassword => 'تأكيد كلمة المرور';
	@override String get confirmPasswordHint => 'أعد إدخال كلمة المرور';
	@override String get button => 'إنشاء حساب';
	@override String get haveAccount => 'لديك حساب بالفعل؟';
	@override String get logIn => 'تسجيل الدخول';
}

// Path: forgetPassword
class _Translations$forgetPassword$ar implements Translations$forgetPassword$en {
	_Translations$forgetPassword$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'هل نسيت كلمة المرور؟';
	@override String get sub => 'أدخل عنوان البريد الإلكتروني المرتبط بحسابك. سنرسل لك رمزًا لمرة واحدة لإعادة تعيين كلمة المرور.';
	@override String get email => 'البريد الإلكتروني';
	@override String get emailHint => 'أدخل بريدك الإلكتروني';
	@override String get sendCode => 'إرسال الرمز';
	@override String get back => 'العودة';
	@override String get button => 'إرسال الرمز';
}

// Path: otpVerification
class _Translations$otpVerification$ar implements Translations$otpVerification$en {
	_Translations$otpVerification$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'التحقق من الرمز';
	@override String get sub => 'أدخل الرمز المكون من 5 أرقام الذي أُرسل إلى بريدك الإلكتروني.';
	@override String get cancel => 'إلغاء';
	@override String get button => 'تحقق';
}

// Path: createNewPassword
class _Translations$createNewPassword$ar implements Translations$createNewPassword$en {
	_Translations$createNewPassword$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إنشاء كلمة مرور جديدة';
	@override String get password => 'كلمة المرور';
	@override String get confirmPassword => 'تأكيد كلمة المرور';
	@override String get confirmPasswordHint => 'أعد إدخال كلمة المرور';
	@override String get cancel => 'إلغاء';
	@override String get button => 'إرسال';
}

// Path: home
class _Translations$home$ar implements Translations$home$en {
	_Translations$home$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get greeting => 'مرحبًا، {name}!';
	@override String get title => 'اعثر على طبيبك';
	@override String get search => 'بحث';
	@override String get liveDoctors => 'أطباء متاحون';
	@override String get popularDoctors => 'الأطباء الأكثر شعبية';
	@override String get featureDoctors => 'أطباء مميزون';
	@override String get viewAll => 'عرض الكل';
}

// Path: doctorDetails
class _Translations$doctorDetails$ar implements Translations$doctorDetails$en {
	_Translations$doctorDetails$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تفاصيل الطبيب';
	@override String get running => 'جارٍ';
	@override String get ongoing => 'مستمر';
	@override String get patient => 'مريض';
	@override String get services => 'الخدمات';
	@override String get hour => '/ساعة';
	@override String get bookNow => 'احجز الآن';
}

// Path: onboarding.onboarding1
class _Translations$onboarding$onboarding1$ar implements Translations$onboarding$onboarding1$en {
	_Translations$onboarding$onboarding1$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اعثر على أطباء موثوقين';
	@override String get sub => 'خلافًا للاعتقاد الشائع، ليس لوريم إيبسوم نصًا عشوائيًا، بل تعود جذوره إلى أكثر من 2000 عام.';
}

// Path: onboarding.onboarding2
class _Translations$onboarding$onboarding2$ar implements Translations$onboarding$onboarding2$en {
	_Translations$onboarding$onboarding2$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اختر أفضل الأطباء';
	@override String get sub => 'خلافًا للاعتقاد الشائع، ليس لوريم إيبسوم نصًا عشوائيًا، بل تعود جذوره إلى أكثر من 2000 عام.';
}

// Path: onboarding.onboarding3
class _Translations$onboarding$onboarding3$ar implements Translations$onboarding$onboarding3$en {
	_Translations$onboarding$onboarding3$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مواعيد سهلة';
	@override String get sub => 'خلافًا للاعتقاد الشائع، ليس لوريم إيبسوم نصًا عشوائيًا، بل تعود جذوره إلى أكثر من 2000 عام.';
}

// Path: chooseRole.patient
class _Translations$chooseRole$patient$ar implements Translations$chooseRole$patient$en {
	_Translations$chooseRole$patient$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مريض';
	@override String get sub => 'اعثر على الأطباء واحجز المواعيد وأدر سجلاتك الطبية.';
}

// Path: chooseRole.admin
class _Translations$chooseRole$admin$ar implements Translations$chooseRole$admin$en {
	_Translations$chooseRole$admin$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مشرف';
	@override String get sub => 'أدر الأطباء والمواعيد والمستخدمين والمنصة.';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'onboarding.next' => 'التالي',
			'onboarding.skip' => 'تخطي',
			'onboarding.getStarted' => 'ابدأ الآن',
			'onboarding.onboarding1.title' => 'اعثر على أطباء موثوقين',
			'onboarding.onboarding1.sub' => 'خلافًا للاعتقاد الشائع، ليس لوريم إيبسوم نصًا عشوائيًا، بل تعود جذوره إلى أكثر من 2000 عام.',
			'onboarding.onboarding2.title' => 'اختر أفضل الأطباء',
			'onboarding.onboarding2.sub' => 'خلافًا للاعتقاد الشائع، ليس لوريم إيبسوم نصًا عشوائيًا، بل تعود جذوره إلى أكثر من 2000 عام.',
			'onboarding.onboarding3.title' => 'مواعيد سهلة',
			'onboarding.onboarding3.sub' => 'خلافًا للاعتقاد الشائع، ليس لوريم إيبسوم نصًا عشوائيًا، بل تعود جذوره إلى أكثر من 2000 عام.',
			'chooseRole.button' => 'متابعة',
			'chooseRole.title' => 'اختر دورك',
			'chooseRole.sub' => 'يحدد الدور المختار التجربة والميزات المتاحة',
			'chooseRole.patient.title' => 'مريض',
			'chooseRole.patient.sub' => 'اعثر على الأطباء واحجز المواعيد وأدر سجلاتك الطبية.',
			'chooseRole.admin.title' => 'مشرف',
			'chooseRole.admin.sub' => 'أدر الأطباء والمواعيد والمستخدمين والمنصة.',
			'logIn.title' => 'تسجيل الدخول',
			'logIn.email' => 'البريد الإلكتروني',
			'logIn.emailHint' => 'أدخل بريدك الإلكتروني',
			'logIn.password' => 'كلمة المرور',
			'logIn.forgetPassword' => 'هل نسيت كلمة المرور؟',
			'logIn.button' => 'تسجيل الدخول',
			'logIn.noAccount' => 'ليس لديك حساب؟',
			'logIn.signUp' => 'سجل الآن',
			'signUp.title' => 'إنشاء حساب',
			'signUp.name' => 'الاسم',
			'signUp.nameHint' => 'أدخل اسمك الكامل',
			'signUp.email' => 'البريد الإلكتروني',
			'signUp.emailHint' => 'أدخل بريدك الإلكتروني',
			'signUp.password' => 'كلمة المرور',
			'signUp.passwordHint' => 'أدخل كلمة المرور',
			'signUp.confirmPassword' => 'تأكيد كلمة المرور',
			'signUp.confirmPasswordHint' => 'أعد إدخال كلمة المرور',
			'signUp.button' => 'إنشاء حساب',
			'signUp.haveAccount' => 'لديك حساب بالفعل؟',
			'signUp.logIn' => 'تسجيل الدخول',
			'forgetPassword.title' => 'هل نسيت كلمة المرور؟',
			'forgetPassword.sub' => 'أدخل عنوان البريد الإلكتروني المرتبط بحسابك. سنرسل لك رمزًا لمرة واحدة لإعادة تعيين كلمة المرور.',
			'forgetPassword.email' => 'البريد الإلكتروني',
			'forgetPassword.emailHint' => 'أدخل بريدك الإلكتروني',
			'forgetPassword.sendCode' => 'إرسال الرمز',
			'forgetPassword.back' => 'العودة',
			'forgetPassword.button' => 'إرسال الرمز',
			'otpVerification.title' => 'التحقق من الرمز',
			'otpVerification.sub' => 'أدخل الرمز المكون من 5 أرقام الذي أُرسل إلى بريدك الإلكتروني.',
			'otpVerification.cancel' => 'إلغاء',
			'otpVerification.button' => 'تحقق',
			'createNewPassword.title' => 'إنشاء كلمة مرور جديدة',
			'createNewPassword.password' => 'كلمة المرور',
			'createNewPassword.confirmPassword' => 'تأكيد كلمة المرور',
			'createNewPassword.confirmPasswordHint' => 'أعد إدخال كلمة المرور',
			'createNewPassword.cancel' => 'إلغاء',
			'createNewPassword.button' => 'إرسال',
			'home.greeting' => 'مرحبًا، {name}!',
			'home.title' => 'اعثر على طبيبك',
			'home.search' => 'بحث',
			'home.liveDoctors' => 'أطباء متاحون',
			'home.popularDoctors' => 'الأطباء الأكثر شعبية',
			'home.featureDoctors' => 'أطباء مميزون',
			'home.viewAll' => 'عرض الكل',
			'doctorDetails.title' => 'تفاصيل الطبيب',
			'doctorDetails.running' => 'جارٍ',
			'doctorDetails.ongoing' => 'مستمر',
			'doctorDetails.patient' => 'مريض',
			'doctorDetails.services' => 'الخدمات',
			'doctorDetails.hour' => '/ساعة',
			'doctorDetails.bookNow' => 'احجز الآن',
			_ => null,
		};
	}
}
