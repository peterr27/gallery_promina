import 'package:flutter/material.dart';

extension AppWhiteSpace on num {
  SizedBox get wsh => SizedBox(width: toDouble());

  SizedBox get wsv => SizedBox(height: toDouble());
}
