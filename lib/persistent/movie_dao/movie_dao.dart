import '../../../data/vos/movie_vo/movie_vo.dart';

abstract class MovieDAO {
  void save(List<MovieVO> movies);

  List<MovieVO>? getMovieListByGenreIDFromDataBase();

  List<MovieVO>? getTopRatedMoviesFromDatabase();

  List<MovieVO>? getPopularMoviesFromDatabase();

  List<MovieVO>? getSimilarMoviesFromDatabase();

  Stream<List<MovieVO>?> getMovieListByGenreIDFromDataBaseStream();

  Stream<List<MovieVO>?> getTopRatedMoviesFromDatabaseStream();

  Stream<List<MovieVO>?> getPopularMoviesFromDatabaseStream();

  Stream<List<MovieVO>?> getSimilarMoviesFromDatabaseStream();

  Stream watchMovieBox();

  void clearMoviesBox();

  void clearMoviesByGenresID();

  void clearSimilarMoviesBox();
}
