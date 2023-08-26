import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget(
      {Key? key,
      this.isAutoFocus = false,
      this.isEnable = false,
      required this.onTap,
      this.onChange})
      : super(key: key);

  final bool isAutoFocus;
  final bool isEnable;
  final Function onTap;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(color: kPrimaryTextColor),
              autofocus: isAutoFocus,
              enabled: isEnable,
              onChanged: onChange,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kSP20x)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kSP20x)),
                filled: true,
                fillColor: kTextFieldBackgroundColor,
                hintText: kSearchMoviesText,
                hintStyle: const TextStyle(color: kSecondaryTextColor),
              ),
            ),
          ),
          const SizedBox(width: kSP20x),
          GestureDetector(
            onTap: () => onTap(),
            child: Container(
              padding: const EdgeInsets.all(kSP10x),
              decoration: BoxDecoration(
                  color: kSecondaryBackgroundColor,
                  borderRadius: BorderRadius.circular(kSP15x)),
              child: const Icon(
                Icons.search,
                color: kPrimaryTextColor,
                size: kSearchIconSize,
              ),
            ),
          )
        ],
      ),
    );
  }
}
