import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF0EBE7E);
  static const Color primaryLight = Color(0xFF07D9AD);
  static const Color primaryDark = Color(0xFF006C49);

  // Secondary
  static const Color secondary = Color(0xFF);
  static const Color secondaryLight = Color(0xFF6F7FA1);
  static const Color secondaryDark = Color(0xFF536184);

  // Text
  static const Color textMain = Color(0xFF333333);
  static Color textSub = Color(0xFF677294).withValues(alpha: 0.9);
  static const Color textPlaceholder = Color(0xFF677294);
  static Color textBorders = Color(0xFF677294).withValues(alpha: 0.16);

  // Status
  static const Color danger = Color(0xFFFF484C);
  static const Color dangerLight = Color(0xFFFF6C60);
  static const Color success = Color(0xFF0EBE7F);
  static const Color successLight = Color(0xFFE7F8F2);
  static const Color warning = Color(0xFFFE7F44);
  static const Color warningLight = Color(0xFFFFCF68);

  // Base
  static const Color white = Color(0xffFAFCFB);
  static const Color black = Color(0xFF333333);
  static Color boxShadow = Color(0xFF000000).withValues(alpha: 0.8);
}
