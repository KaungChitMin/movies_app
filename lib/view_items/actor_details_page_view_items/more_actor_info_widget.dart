import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/info_widget.dart';

class MoreActorInfoWidget extends StatelessWidget {
  const MoreActorInfoWidget(
      {Key? key,
      required this.popularity,
      required this.birthDay,
      required this.deadDay,
      required this.gender,
      required this.placeOfBirth})
      : super(key: key);
  final String deadDay;
  final String birthDay;
  final String gender;
  final String placeOfBirth;
  final double popularity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP10x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EasyText(
            text: kMoreInformationText,
            fontWeight: FontWeight.w600,
            fontSize: kFontSie24x,
          ),
          const Divider(
            color: kSecondaryTextColor,
            thickness: 2,
          ),
          const SizedBox(
            height: kSP10x,
          ),
          InfoWidget(
            firstInfoText: kPlaceOfBirthText,
            secondInfoText: placeOfBirth,
          ),
          const SizedBox(
            height: kSP10x,
          ),
          InfoWidget(
            firstInfoText: kBirthDayText,
            secondInfoText: birthDay,
          ),
          const SizedBox(
            height: kSP10x,
          ),
          InfoWidget(
            firstInfoText: kDeadDayText,
            secondInfoText: deadDay.isEmpty ? "-" : deadDay,
          ),
          const SizedBox(
            height: kSP10x,
          ),
          InfoWidget(
            firstInfoText: kGenderText,
            secondInfoText: gender,
          ),
          const SizedBox(
            height: kSP10x,
          ),
          InfoWidget(
            firstInfoText: kPopularityText,
            secondInfoText: popularity.toString(),
          ),
        ],
      ),
    );
  }
}
