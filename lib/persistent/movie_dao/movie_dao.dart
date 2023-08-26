import '../../../data/vos/movie_vo/movie_vo.dart';

abstract class MovieDAO {
  void save(List<MovieVO> movies);

  List<MovieVO>? getMovieListByGenreIDFromDataBase();

  Stream<List<MovieVO>?> getMovieListByGenreIDFromDataBaseStream();

  Stream watchMovieBox();

  void clearMoviesBox();

  void clearMoviesByGenresID();
}
