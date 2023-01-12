import 'package:flutter/material.dart';

extension MediaQuerySize on BuildContext {
  double getWidth() => MediaQuery.of(this).size.width;

  double getHeight() => MediaQuery.of(this).size.height;
}
