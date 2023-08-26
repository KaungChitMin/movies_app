import '../../data/vos/genre_vo/genre_vo.dart';
import '../../data/vos/movie_vo/movie_vo.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>?> getSearchMovies(int page, String query);

  Future<List<GenreVO>?> getGenreTypeAsList();

  Future<List<MovieVO>?> getMovieListByGenreId(genreID, page);
}



