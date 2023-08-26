import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/search_page_bloc.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../../widgets/easy_image_widget.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/loading_widget.dart';

class SearchMovieListItemView extends StatelessWidget {
  const SearchMovieListItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, ScrollController>(
        selector: (_, bloc) => bloc.getSearchMoviesListSC,
        builder: (_, controller, __) =>
            Selector<SearchPageBloc, List<MovieVO>?>(
                shouldRebuild: (pre, next) => pre != next,
                selector: (_, bloc) => bloc.getSearchMoviesList,
                builder: (_, searchMoviesList, __) {
                  if (searchMoviesList == null || searchMoviesList.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Expanded(
                    child: MovieListScrollView(
                      movieList: searchMoviesList,
                      controller: controller,
                    ),
                  );
                }));
  }
}

class MovieListScrollView extends StatelessWidget {
  const MovieListScrollView({
    super.key,
    required this.movieList,
    required this.controller,
  });

  final ScrollController controller;
  final List<MovieVO> movieList;

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, bool>(
      selector: (_, bloc) => SearchPageBloc().getIsSearching,
      builder: (_, isSearching, __) => (isSearching)
          ? const LoadingWidget()
          : ListView.separated(
              scrollDirection: Axis.vertical,
              controller: controller,
              itemCount: movieList.length,
              padding: const EdgeInsets.symmetric(
                  horizontal: kSP5x, vertical: kSP10x),
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {},
                  child: SearchMoviesDetailsView(
                    movies: movieList[index],
                  ),
                );
              },
              separatorBuilder: (_, index) => const SizedBox(
                height: kSP10x,
              ),
            ),
    );
  }
}

class SearchMoviesDetailsView extends StatelessWidget {
  const SearchMoviesDetailsView({
    super.key,
    required this.movies,
  });

  final MovieVO movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kTextFieldBackgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          EasyImageWidget(
            height: 80,
            width: 80,
            image: movies.posterPath ?? '',
          ),
          Expanded(
              child: SearchMovieDateAndGenreView(
            title: movies.title ?? '',
            overView: movies.overview ?? '',
            year: (movies.releaseDate == null) ||
                    (movies.releaseDate?.isEmpty ?? true)
                ? DateTime.now().year.toString()
                : DateTime.parse(movies.releaseDate ?? '').year.toString(),
          ))
        ],
      ),
    );
  }
}

class SearchMovieDateAndGenreView extends StatelessWidget {
  const SearchMovieDateAndGenreView({
    super.key,
    required this.title,
    required this.overView,
    required this.year,
  });

  final String title;
  final String overView;
  final String year;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: EasyText(
        text: title,
      ),
      subtitle: EasyText(
        text: overView,
      ),
      trailing: Container(
        color: kSecondaryBackgroundColor,
        child: EasyText(
          text: year,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
