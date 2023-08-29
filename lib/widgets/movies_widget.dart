import 'package:flutter/material.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../pages/details_page.dart';
import '../view_items/home_page_view_items/home_page_view_items.dart';
import 'easy_text_widget.dart';
import 'gradient_widget.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key, required this.movieVO});

  final MovieVO movieVO;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateToNextScreen(
            context, DetailsPage(movieID: movieVO.id ?? 0));
      },
      child: Container(
        width: kMovieWidth,
        margin: const EdgeInsets.only(right: kSP20x),
        child: Stack(
          children: [
            Positioned.fill(
                child: BannerMovieImageView(
              imageUrl: movieVO.posterPath ?? '',
            )),
            const GradientWidget(),
            Align(
              alignment: Alignment.bottomLeft,
              child: MovieNameRatingAndVoteView(
                movieName: movieVO.title ?? '',
                rating: movieVO.voteAverage ?? 0,
                voteCount: movieVO.voteCount ?? 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieNameRatingAndVoteView extends StatelessWidget {
  const MovieNameRatingAndVoteView(
      {super.key,
      required this.movieName,
      required this.rating,
      required this.voteCount});

  final String movieName;
  final double rating;
  final int voteCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: kSP5x, bottom: kSP5x),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EasyText(
              text: movieName,
              fontSize: kFontSie18x,
              fontWeight: FontWeight.w700,
              maxLine: 3,
            ),
            const SizedBox(
              height: kSP10x,
            ),
            Row(
              children: [
                const Icon(Icons.star_border_purple500_outlined,
                    color: Colors.amber),
                const SizedBox(width: kSP5x),
                EasyText(text: rating.toString(), fontWeight: FontWeight.w600),
                const SizedBox(
                  width: kSP20x,
                ),
                EasyText(
                  text: '$voteCount vote'.addS(),
                  fontWeight: FontWeight.w600,
                  color: kSecondaryTextColor,
                )
              ],
            )
          ]),
    );
  }
}
