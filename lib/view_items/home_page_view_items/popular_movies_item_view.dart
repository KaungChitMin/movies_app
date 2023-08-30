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

class PopularMoviesItemView extends StatelessWidget {
  const PopularMoviesItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
      selector: (_, bloc) => bloc.getPopularMoviesList,
      builder: (_, popularMovieList, __) {
        if (popularMovieList == null) {
          return const Center(child: LoadingWidget());
        }
        if (popularMovieList.isEmpty) {
          const Center(
              child: EasyText(
            text: kNoDataText,
          ));
        }
        return PopularMovieControllerView(
          movieList: popularMovieList,
        );
      },
    );
  }
}

class PopularMovieControllerView extends StatelessWidget {
  const PopularMovieControllerView({super.key, required this.movieList});

  final List<MovieVO> movieList;

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, ScrollController>(
      selector: (_, bloc) => bloc.controllerForPopularMovies,
      builder: (_, controller, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EasyText(
              text: kPopularMoviesText,
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
