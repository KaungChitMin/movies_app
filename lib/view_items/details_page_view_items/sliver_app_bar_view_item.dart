import 'package:flutter/material.dart';
import 'package:movies_database/constant/colors.dart';
import 'package:movies_database/constant/dimens.dart';
import 'package:movies_database/widgets/easy_image_widget.dart';
import 'package:movies_database/widgets/easy_text_widget.dart';

class SliverAppBarItemView extends StatelessWidget {
  const SliverAppBarItemView({
    super.key,
    required this.movieName,
    required this.imageUrl,
    required this.onTapBack,
    required this.runTime,
  });

  final String movieName;
  final String imageUrl;
  final Function onTapBack;
  final String runTime;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryBackgroundColor,
      expandedHeight: kSliverAppBarActorDetailsHeight,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Hero(
          transitionOnUserGestures: true,
          tag: movieName,
          child: EasyText(
            text: movieName,
          ),
        ),

        ///Image and Back Button icon
        background: Stack(children: [
          Positioned.fill(
            child: Hero(
              transitionOnUserGestures: true,
              tag: imageUrl,
              child: EasyImageWidget(
                image: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),


         Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSP20x,vertical: kSP70x),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: ()=>onTapBack(),
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
          ),

          Align(
            alignment: Alignment.bottomRight,
           child: EasyText(
             text: runTime,
             color: Colors.amber,
             fontWeight: FontWeight.w700,
             fontSize: 30,
           )
          )
        ]),
      ),
    );
  }
}
