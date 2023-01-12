


import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_size_manager.dart';

class ThemeManager{



  static ThemeData getTheme(){
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      textTheme: TextTheme(
        titleMedium:TextStyle(
          color: ColorManager.black,
          fontSize: FontSizeManager.mediumTitle,
        )
      )
    );
  }
}