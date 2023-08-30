import 'package:movies_database/data/vos/actor_details_vo/actor_details_vo.dart';
import 'package:movies_database/data/vos/actor_vo/actor_vo.dart';
import 'package:movies_database/data/vos/credit_vo/cast_vo/crew_vo.dart';

import '../../data/vos/credit_vo/cast_vo/cast_vo.dart';
import '../../data/vos/genre_vo/genre_vo.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../../data/vos/movies_details_vo/movie_details_vo.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>?> getSearchMovies(int page, String query);

  Future<List<GenreVO>?> getGenreTypeAsList();

  Future<List<MovieVO>?> getMovieListByGenreId(genreID, page);

  Future<List<MovieVO>?> getTopRattedMovies(int page);

  Future<List<MovieVO>?> getPopularMovies(int page);

  Future<List<ActorVO>?> getActorList(int page);

  Future<ActorDetailsVO?> getActorDetailsVo(int actorID);

  Future<MovieDetailsVO?> getMovieDetailsVO(int movieID);

  Future<List<CastVO>?> getCastList(int movieID);

  Future<List<CrewVO>?> getCrewList(int movieID);

  Future<List<MovieVO>?> getSimilarMoviesList(int page, int movieID);
}
