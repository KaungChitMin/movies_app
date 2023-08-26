import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
    this.endColor = Colors.black87,
  });
  final Color endColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.transparent, endColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
