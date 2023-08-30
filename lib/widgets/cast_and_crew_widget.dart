import 'package:flutter/material.dart';
import 'package:movies_database/widgets/easy_image_widget.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';
import 'easy_text_widget.dart';

class CastAndCrewProfileNameWidget extends StatelessWidget {
  const CastAndCrewProfileNameWidget(
      {Key? key,
        required this.name,
        required this.profilePath,
        required this.titleText})
      : super(key: key);
  final String profilePath;
  final String titleText;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CastAndCrewProfileView(profileImage: profilePath),
        const SizedBox(
          width: kSP10x,
        ),
        CastAndCrewNameView(name: name, title: titleText),
        const SizedBox(
          width: kSP10x,
        ),
      ],
    );
  }
}

class CastAndCrewNameView extends StatelessWidget {
  const CastAndCrewNameView({Key? key, required this.name, required this.title})
      : super(key: key);
  final String title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EasyText(
          text: title,
          fontSize: kFontSie15x,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(
          height: kSP5x,
        ),
        Flexible(
          child: EasyText(
            maxLine: 2,
            text: name,
            fontWeight: FontWeight.w600,
            color: kSecondaryTextColor,
          ),
        ),
      ],
    );
  }
}

class CastAndCrewProfileView extends StatelessWidget {
  const CastAndCrewProfileView({Key? key, required this.profileImage})
      : super(key: key);
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kCircleImageHeight,
      height: kCircleImageHeight,
      color: kPrimaryBackgroundColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kSP30x),
        child: EasyImageWidget(
          image: profileImage,
        ),
      ),
    );
  }
}
