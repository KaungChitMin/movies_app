import 'package:flutter/material.dart';
import 'package:movies_database/constant/colors.dart';
import 'package:movies_database/constant/dimens.dart';

import '../../widgets/easy_text_widget.dart';

class MovieTypeView extends StatelessWidget {
  const MovieTypeView({super.key, required this.movieType});

  final List<String> movieType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP8x,vertical: kSP20x),
      child: Wrap(
        runSpacing: 8,
        spacing: 5,
          children: List.generate(movieType.length, (index) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(kSP20x)),
          child: EasyText(
            text: movieType[index],
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: kSecondaryTextColor,
          ),
        );
      })),
    );
  }
}
