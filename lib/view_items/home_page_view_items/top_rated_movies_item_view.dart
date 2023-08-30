import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/home_page_bloc.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/movies_widget.dart';

class YouMayLikeItemView extends StatelessWidget {
  const YouMayLikeItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
      selector: (_, bloc) => bloc.getTopRatedMoviesList,
      builder: (_, topRatedMoviesList, __) {
        if (topRatedMoviesList == null) {
          return const Center(child: LoadingWidget());
        }
        if (topRatedMoviesList.isEmpty) {
          const Center(
              child: EasyText(
                text: kNoDataText,
              ));
        }
        return TopRatedMoviesController(
          movieList: topRatedMoviesList,
        );
      },
    );
  }
}

class TopRatedMoviesController extends StatelessWidget {
  const TopRatedMoviesController({super.key, required this.movieList});

  final List<MovieVO> movieList;

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, ScrollController>(
      selector: (_, bloc) => bloc.controllerForTopRatedMovies,
      builder: (_, controller, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EasyText(
              text: kYouMayLikeText,
              fontSize: kFontSie21x,
              fontWeight: FontWeight.w500,
              color: kPrimaryTextColor,
            ),
            const SizedBox(
              height: kSP20x,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  itemCount: movieList.length,
                  itemBuilder: (_, index) =>
                      MovieWidget(movieVO: movieList[index])),
            ),
          ],
        );
      },
    );
  }
}
