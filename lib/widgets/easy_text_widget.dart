// import 'package:flutter/material.dart';
// import 'package:movie_database/constant/colors.dart';
//
// class EasyTextWidget extends StatelessWidget {
//   const EasyTextWidget(
//       {Key? key,
//       required this.text,
//       this.fontSize = 14,
//       this.fontWeight = FontWeight.w400,
//       this.color = kPrimaryTextColor,
//       this.maxLines,
//       this.overflow = TextOverflow.ellipsis,
//       this.decoration = TextDecoration.none})
//       : super(key: key);
//
//   final String text;
//   final double fontSize;
//   final FontWeight fontWeight;
//   final Color color;
//   final int? maxLines;
//   final TextOverflow overflow;
//   final TextDecoration decoration;
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       maxLines: maxLines,
//       style: TextStyle(
//           fontSize: fontSize,
//           fontWeight: fontWeight,
//           color: color,
//           overflow: overflow,
//           decoration: decoration),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../utils/text_utils.dart';


class EasyText extends StatelessWidget {
  const EasyText(
      {Key? key,
        required this.text,
        this.fontSize = kFontSie14x,
        this.fontWeight = FontWeight.w400,
        this.color = kPrimaryTextColor,
        this.decoration = TextDecoration.none,
        this.maxLine,
        this.overflow = TextOverflow.ellipsis})
      : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration decoration;
  final TextOverflow overflow;
  final int ?maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(
          fontSize: FontTypography.getFontSizeByDevice(context, fontSize),
          fontWeight: fontWeight,
          color: color,
          decoration: decoration,
          overflow: overflow),
    );
  }
}
