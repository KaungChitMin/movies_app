import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../widgets/easy_text_widget.dart';

class BiographyItemView extends StatelessWidget {
  const BiographyItemView({Key? key, required this.biography})
      : super(key: key);
  final String biography;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP10x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EasyText(
            text: kBiographyText,
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
          EasyText(
            maxLine: 50,
            text: biography,
            fontWeight: FontWeight.w400,
            color: kSecondaryTextColor,
            fontSize: kFontSie18x,
          ),
        ],
      ),
    );
  }
}
