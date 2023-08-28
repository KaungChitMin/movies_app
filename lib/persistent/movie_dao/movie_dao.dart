import '../../../data/vos/movie_vo/movie_vo.dart';

abstract class MovieDAO {
  void save(List<MovieVO> movies);

  List<MovieVO>? getMovieListByGenreIDFromDataBase();

  List<MovieVO>? getTopRatedMoviesFromDatabase();

  List<MovieVO>? getPopularMoviesFromDatabase();

  Stream<List<MovieVO>?> getMovieListByGenreIDFromDataBaseStream();

  Stream<List<MovieVO>?> getTopRatedMoviesFromDatabaseStream();

  Stream<List<MovieVO>?> getPopularMoviesFromDatabaseStream();

  Stream watchMovieBox();

  void clearMoviesBox();

  void clearMoviesByGenresID();
}
