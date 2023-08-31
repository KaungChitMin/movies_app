import 'package:flutter/material.dart';
import 'package:movies_database/constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../widgets/easy_text_widget.dart';

class StoryLineView extends StatelessWidget {
  const StoryLineView({
    super.key,
    required this.overview,
  });

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EasyText(
            text: kStoryLineText,
            fontSize: kFontSie23x,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: kSP10x,
          ),
          EasyText(
            maxLine: 50,
            text: overview,
            fontSize: kFontSie18x,
            fontWeight: FontWeight.w500,
            color: kSecondaryTextColor,
          ),
        ],
      ),
    );
  }
}
