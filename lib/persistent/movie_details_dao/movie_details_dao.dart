import '../../data/vos/movies_details_vo/movie_details_vo.dart';

abstract class MovieDetailsDAO {
  void save(MovieDetailsVO movieDetailsVO);

  MovieDetailsVO? getMovieDetailVOFromDatabase(int movieID);

  Stream<MovieDetailsVO?> getMovieDetailsVOFromDatabaseStream(int movieID);

  Stream watchMovieDetailsBox();
}
