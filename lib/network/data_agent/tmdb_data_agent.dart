import '../../data/vos/genre_vo/genre_vo.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../../data/vos/movies_details_vo/movie_details_vo.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>?> getSearchMovies(int page, String query);

  Future<List<GenreVO>?> getGenreTypeAsList();

  Future<List<MovieVO>?> getMovieListByGenreId(genreID, page);

  Future<MovieDetailsVO?> getMovieDetailsVO (int movieID);
}



