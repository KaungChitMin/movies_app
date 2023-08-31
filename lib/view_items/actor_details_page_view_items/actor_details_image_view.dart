import 'package:flutter/material.dart';
import 'package:movies_database/widgets/easy_image_widget.dart';

import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/gradient_widget.dart';

class ActorDetailsImageView extends StatelessWidget {
  const ActorDetailsImageView(
      {Key? key,
      required this.onTapBack,
      required this.profileImage,
      required this.actorName})
      : super(key: key);
  final String profileImage;
  final Function onTapBack;
  final String actorName;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: kPrimaryBackgroundColor,
      automaticallyImplyLeading: false,
      expandedHeight: kSliverAppBarActorDetailsHeight,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Hero(
          transitionOnUserGestures: true,
          tag: actorName,
          child: EasyText(
            text: actorName,
            fontSize: kFontSie21x,
            fontWeight: FontWeight.w700,
          ),
        ),
        background: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                transitionOnUserGestures: true,
                tag: profileImage,
                child: EasyImageWidget(
                  image: profileImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const GradientWidget(
              endColor: Colors.black54,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSP10x, vertical: kSP50x),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => onTapBack(),
                  child: const CircleAvatar(
                    radius: kBackButtonSize,
                    backgroundColor: kSecondaryBackgroundColor,
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: kPrimaryTextColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
