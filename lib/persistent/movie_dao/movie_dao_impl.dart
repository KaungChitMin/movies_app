import 'package:hive/hive.dart';
import 'package:movies_database/constant/hive_constant.dart';
import 'package:movies_database/persistent/movie_dao/movie_dao.dart';

import '../../data/vos/movie_vo/movie_vo.dart';

class MovieDaoImpl extends MovieDAO {
  MovieDaoImpl._();

  static final MovieDaoImpl _singleton = MovieDaoImpl._();

  factory MovieDaoImpl() => _singleton;

  /// Box
  Box<MovieVO> _getMovieBox() => Hive.box(kBoxNameForMovieVO);

  /// Database
  @override
  void save(List<MovieVO> movies) {
    int order = 0;
    final movieList = _getMovieBox().values.toList();
    if (movieList.isNotEmpty) {
      order = movieList.last.order;
    }
    for (var value in movies) {
      order++;
      value.order = order;
      _getMovieBox().put(value.id, value);
    }
  }

  @override
  List<MovieVO>? getMovieListByGenreIDFromDataBase() {
    final movieList = _getMovieBox().values.toList();

    movieList.sort((a, b) => a.order.compareTo(b.order));

    return movieList.where((e) => e.isMoviesByGenres ?? false).toList();
  }

  @override
  List<MovieVO>? getTopRatedMoviesFromDatabase() {
    final movieList = _getMovieBox().values.toList();
    movieList.sort((a, b) => a.order.compareTo(b.order));
    return movieList
        .where((element) => element.isGetNowPlaying ?? false)
        .toList();
  }

  @override
  List<MovieVO>? getPopularMoviesFromDatabase() {
    final movieList = _getMovieBox().values.toList();
    movieList.sort((a, b) => a.order.compareTo(b.order));
    return movieList
        .where((element) => element.isPopularMovies ?? false)
        .toList();
  }

  /// Database Stream
  @override
  Stream<List<MovieVO>?> getMovieListByGenreIDFromDataBaseStream() =>
      Stream.value(getMovieListByGenreIDFromDataBase());

  @override
  Stream<List<MovieVO>?> getTopRatedMoviesFromDatabaseStream() =>
      Stream.value(getTopRatedMoviesFromDatabase());

  @override
  Stream<List<MovieVO>?> getPopularMoviesFromDatabaseStream()=>
      Stream.value(getPopularMoviesFromDatabase());

  /// Watch box and Clear box
  @override
  Stream watchMovieBox() => _getMovieBox().watch();

  @override
  void clearMoviesBox() => _getMovieBox().clear();

  @override
  void clearMoviesByGenresID() {
    final movieList = _getMovieBox().values.toList();
    final movieId = movieList
        .where((element) => element.isMoviesByGenres ?? false)
        .map((e) => e.id)
        .toList();

    for (int? id in movieId) {
      _getMovieBox().delete(id);
    }
  }


}
