import 'package:flutter/material.dart';


class FontTypography{
  static double getFontSizeByDevice(BuildContext context, double fontSize) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    if (pixelRatio < 1.0) {
      return fontSize - 4;
    } else if (pixelRatio >= 1.0 && pixelRatio < 1.5) {
      // mdpi
      return fontSize - 3;
    } else if (pixelRatio >= 1.5 && pixelRatio < 2.0) {
      // hdpi
      // print("Hdpi works");
      return fontSize - 2;
    } else if (pixelRatio >= 2.0 && pixelRatio < 3.0) {
      // xhdpi
      // print("Xhdpi works");
      return fontSize - 1;
    } else if (pixelRatio >= 3.0 && pixelRatio < 4.0) {
      // xxhdpi
      // print("Xxhdpi works");
      return fontSize;
    } else if (pixelRatio >= 4.0) {
      // xxxhdpi
      return fontSize + 1;
    } else {
      return fontSize;
    }
  }
}

