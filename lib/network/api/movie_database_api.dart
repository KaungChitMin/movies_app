// import 'dart:core';
//
// import 'package:dio/dio.dart';
// import 'package:retrofit/http.dart';
//
// import '../../constant/api_constant.dart';
// import '../../data/vos/actor_details_vo/actor_details_vo.dart';
// import '../../data/vos/movies_details_vo/movie_details_vo.dart';
// import '../response/actor_response/actor_response.dart';
// import '../response/cast_and_crew_response/cast_and_crew_response.dart';
// import '../response/genre_response/genre_response.dart';
// import '../response/movie_response/movie_response.dart';
//
// part 'movie_db_api.g.dart';
//
// @RestApi(baseUrl: kBaseURL)
// abstract class TMDBapi {
//   factory TMDBapi(Dio dio) => _TMDBapi(dio);
//
//   @GET(kSearchMovieEndPoint)
//   Future<MovieResponse> getSearchMovieResponse(
//       @Query(kQueryParamsApiKey) String apiKey,
//       @Query(kQueryParamsPage) int page,
//       @Query(kQueryParamsQuery) String query);
//
//   @GET(kMovieByGenresIDEndPoint)
//   Future<MovieResponse> getMovieResponseByGenresIDResponse(
//       @Query(kQueryParamsWithGenres) int genreID,
//       @Query(kQueryParamsApiKey) String apiKey,
//       @Query(kQueryParamsPage) int page);
//
//   @GET(kGenresEndPoint)
//   Future<GenreResponse> getGenreResponse(
//     @Query(kQueryParamsApiKey) String apiKey,
//   );
//
//   @GET(kTopRatedMoviesEndPoint)
//   Future<MovieResponse> getTopRatedMovies(
//     @Query(kQueryParamsApiKey) String apiKey,
//     @Query(kQueryParamsPage) int Page,
//   );
//
//   @GET(kGetPopularMoviesEndPoint)
//   Future<MovieResponse> getPopularMovies(
//     @Query(kQueryParamsApiKey) String apiKey,
//     @Query(kQueryParamsPage) int Page,
//   );
//
//   @GET(kActorListEndPoint)
//   Future<ActorResponse> getActorResponse(
//       @Query(kQueryParamsApiKey) String apiKey,
//       @Query(kQueryParamsPage) int Page);
//
//   @GET(kActorDetailsEndPoint)
//   Future<ActorDetailsVO> getActorDetailsResponse(
//       @Query(kQueryParamsApiKey) String apiKey,
//       @Path(kPathParameterFoActorID) int actorID);
//
//   @GET(kMovieDetailsEndPoint)
//   Future<MovieDetailsVO> getMovieDetailsResponse(
//       @Query(kQueryParamsApiKey) String apiKey,
//       @Path(kPathParameterForMovieID) int movieID);
//
//   @GET(kCreditsEndPoint)
//   Future<CastAndCrewResponse> getCastAndCrewResponse(
//       @Query(kQueryParamsApiKey) String apiKey,
//       @Path(kPathParameterForMovieID) int movieID);
//
//   @GET(kSimilarEndPoint)
//   Future<MovieResponse> getSimilarResponse(
//     @Query(kQueryParamsApiKey) String apiKey,
//     @Query(kQueryParamsPage) int page,
//     @Path(kPathParameterForMovieID) int movieID,
//   );
// }
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../constant/api_constant.dart';
import '../response/genre_response/genre_response.dart';
import '../response/movie_response/movie_response.dart';

part 'movie_database_api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class MovieDBApi {
  factory MovieDBApi(Dio dio) => _MovieDBApi(dio);

  @GET(kSearchMovieEndPoint)
  Future<MovieResponse> getSearchMovieResponse(
      @Query(kQueryParamsApiKey) String apiKey,
      @Query(kQueryParamsPage) int page,
      @Query(kQueryParamsQuery) String query);

  @GET(kGenresEndPoint)
  Future<GenreResponse> getGenreResponse(
      @Query(kQueryParamsApiKey) String apiKey);

  @GET(kMovieByGenresIDEndPoint)
  Future<MovieResponse> getMovieByGenreId(
      @Query(kQueryParamsWithGenres) int genreID,
      @Query(kQueryParamsApiKey) String apiKey,
      @Query(kQueryParamsPage) int page);
}
