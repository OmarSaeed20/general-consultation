import 'package:flutter/material.dart';

class AppConstants {
  // static final IndicatorStateListenable listenable = IndicatorStateListenable();
  static const int zero = 0;
  static const String empty = '';
  static List<BoxShadow> get boxShadow => [
        BoxShadow(
          color: const Color(0xFFAAAAAA).withOpacity(0.15),
          blurRadius: 5,
          offset: const Offset(-2, 2),
        ),
      ];
}
