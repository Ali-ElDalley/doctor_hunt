import 'package:flutter/material.dart';

extension TextEditingControllerEx on TextEditingController {
  String get getText => text.trim();
}
