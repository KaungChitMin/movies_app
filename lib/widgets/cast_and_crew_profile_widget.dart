import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';
import 'easy_image_widget.dart';
import 'easy_text_widget.dart';

class CastAndCrewImageNameWidget extends StatelessWidget {
  const CastAndCrewImageNameWidget(
      {super.key,
      required this.imageUrl,
      required this.gender,
      required this.actorName});

  final String imageUrl;
  final String gender;
  final String actorName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kSP50x,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kSP30x),
                child: EasyImageWidget(
                  image: imageUrl,
                ),
              ),
            ),
            const SizedBox(
              width: kSP10x,
            ),
            Column(
              children: [
                EasyText(
                  text: gender,
                  fontSize: kFontSie15x,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: kSP15x,
                ),
                EasyText(
                  maxLine: 2,
                  text: actorName,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryTextColor,
                )
              ],
            )
          ]),
    );
  }
}
