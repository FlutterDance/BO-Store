
import 'dart:math';

import 'package:flutter/material.dart';

/// 生成随机颜色
extension RandomColor on Color {
  static Color next() {
    return Color.fromARGB(
      255,
      Random.secure().nextInt(255),
      Random.secure().nextInt(255),
      Random.secure().nextInt(255),
    );
  }
}