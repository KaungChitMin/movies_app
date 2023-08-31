import 'package:flutter/material.dart';
import 'package:movies_database/bloc/details_page_bloc.dart';
import 'package:movies_database/constant/strings.dart';
import 'package:movies_database/data/vos/movie_vo/movie_vo.dart';
import 'package:movies_database/widgets/easy_text_widget.dart';
import 'package:movies_database/widgets/loading_widget.dart';
import 'package:movies_database/widgets/movies_widget.dart';
import 'package:provider/provider.dart';

import '../constant/dimens.dart';

class RecommendedMoviesView extends StatelessWidget {
  const RecommendedMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<DetailsPageBLoc, List<MovieVO>?>(
      selector: (_, bloc) => bloc.getSimilarMoviesList,
      builder: (_, movieList, __) {
        if (movieList == null) {
          const Center(
            child: LoadingWidget(),
          );
        }
        if (movieList!.isEmpty) {
          const EasyText(text: kNoDataText);
        }
        return RecommendedControllerView(
          movieList: movieList,
        );
      },
    );
  }
}

class RecommendedControllerView extends StatelessWidget {
  const RecommendedControllerView({
    super.key,
    required this.movieList,
  });

  final List<MovieVO> movieList;

  @override
  Widget build(BuildContext context) {
    return Selector<DetailsPageBLoc, ScrollController>(
        selector: (_, bloc) => bloc.getControllerForSimilarMovies,
        builder: (_, controller, __) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EasyText(
                  text: kRecommendedText,
                  fontSize: kFontSie23x,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: kSP15x,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: movieList.length,
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    itemBuilder: (_, index) =>
                        MovieWidget(movieVO: movieList[index]),
                  ),
                ),
              ],
            ));
  }
}
