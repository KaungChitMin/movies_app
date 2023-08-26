
import '../../data/vos/movies_details_vo/movie_details_vo.dart';

abstract class MovieDetailsDAO {
  void save(MovieDetailsVO movieDetailsVO);

  Stream watchMovieDetailsBox();

  Stream<MovieDetailsVO?> getMoviesDetailsMovieIDStream(int movieID);

  MovieDetailsVO? getMoviesDetailsByMovieID(int movieID);
}
