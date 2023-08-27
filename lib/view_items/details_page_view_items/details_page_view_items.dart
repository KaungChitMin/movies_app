import 'package:flutter/material.dart';
import 'package:movies_database/constant/colors.dart';
import 'package:movies_database/constant/dimens.dart';
import 'package:movies_database/widgets/easy_image_widget.dart';
import 'package:movies_database/widgets/easy_text_widget.dart';

class SilverAppBarItemView extends StatelessWidget {
  const SilverAppBarItemView({
    super.key,
    required this.movieName, required this.imageUrl,
  });

  final String movieName;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: kPrimaryBackgroundColor,
      expandedHeight: kSliverAppBarActorDetailsHeight,
      flexibleSpace: FlexibleSpaceBar(
        title: EasyText(
          text: movieName,
        ),
        background: EasyImageWidget(
          image: imageUrl,
        ),
      ),
    );
  }
}
