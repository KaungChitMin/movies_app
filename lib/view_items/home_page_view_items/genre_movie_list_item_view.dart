import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/home_page_bloc.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/movies_widget.dart';

class GenreMovieListItemView extends StatelessWidget {
  const GenreMovieListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
        shouldRebuild: (first, second) => first != second,
        selector: (_, bloc) => bloc.getGenreMovieList,
        builder: (_, genreMovieList, __) {
          if (genreMovieList == null && genreMovieList!.isEmpty) {
            return const LoadingWidget();
          }
          return GenreMovieListView(
            movieList: genreMovieList,
          );
        });
  }
}

class GenreMovieListView extends StatelessWidget {
  const GenreMovieListView({super.key, required this.movieList});

  final List<MovieVO> movieList;

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, ScrollController>(
        selector: (_, bloc) => bloc.getControllerForGenreMovies,
        builder: (_, controller, __) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              controller: controller,
              itemBuilder: (_, index) {
                return MovieWidget(movieVO: movieList[index]);
              });
        });
  }
}