import 'package:dio/dio.dart';
import 'package:movies_database/constant/api_constant.dart';
import 'package:movies_database/data/vos/actor_details_vo/actor_details_vo.dart';
import 'package:movies_database/data/vos/actor_vo/actor_vo.dart';
import 'package:movies_database/data/vos/credit_vo/cast_vo/cast_vo.dart';
import 'package:movies_database/data/vos/credit_vo/cast_vo/crew_vo.dart';
import 'package:movies_database/data/vos/genre_vo/genre_vo.dart';
import 'package:movies_database/data/vos/movie_vo/movie_vo.dart';
import 'package:movies_database/data/vos/movies_details_vo/movie_details_vo.dart';
import 'package:movies_database/network/api/movie_database_api.dart';
import 'package:movies_database/network/data_agent/tmdb_data_agent.dart';

class MovieDataAgentImpl extends MovieDataAgent {
  late MovieDBApi _movieApi;

  MovieDataAgentImpl._() {
    _movieApi = MovieDBApi(Dio());
  }

  static final _singleton = MovieDataAgentImpl._();

  factory MovieDataAgentImpl() => _singleton;

  @override
  Future<List<MovieVO>?> getSearchMovies(int page, String query) => _movieApi
      .getSearchMovieResponse(kApiToken, page, query)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<GenreVO>?> getGenreTypeAsList() => _movieApi
      .getGenreResponse(kApiToken)
      .asStream()
      .map((event) => event.genres)
      .first;

  @override
  Future<List<MovieVO>?> getMovieListByGenreId(genreID, page) => _movieApi
      .getMovieByGenreId(genreID, kApiToken, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<MovieVO>?> getPopularMovies(int page) => _movieApi
      .getPopularMovies(kApiToken, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<MovieVO>?> getTopRattedMovies(int page) => _movieApi
      .getTopRatedMovies(kApiToken, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<ActorVO>?> getActorList(int page) => _movieApi
      .getActorResponse(kApiToken, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<ActorDetailsVO?> getActorDetailsVo(int actorID) =>
      _movieApi.getActorDetailsResponse(kApiToken, actorID);

  @override
  Future<MovieDetailsVO?> getMovieDetailsVO(int movieID) =>
      _movieApi.getMovieDetailsResponse(kApiToken, movieID);

  @override
  Future<List<CastVO>?> getCastList(int movieID) => _movieApi
      .getCastAndCrewResponse(kApiToken, movieID)
      .asStream()
      .map((event) => event.cast)
      .first;

  @override
  Future<List<CrewVO>?> getCrewList(int movieID) => _movieApi
      .getCastAndCrewResponse(kApiToken, movieID)
      .asStream()
      .map((event) => event.crew)
      .first;

  @override
  Future<List<MovieVO>?> getSimilarMoviesList(int page, int movieID) =>
      _movieApi
          .getSimilarResponse(kApiToken, page, movieID)
          .asStream()
          .map((event) => event.results)
          .first;
}
