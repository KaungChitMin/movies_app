// import '../vos/actor_details_vo/actor_details_vo.dart';
// import '../vos/actor_vo/actor_vo.dart';
// import '../vos/credit_vo/cast_vo/cast_vo.dart';
// import '../vos/credit_vo/cast_vo/crew_vo.dart';
// import '../vos/genre_vo/genres_vo.dart';
// import '../vos/movie_vo/movie_vo.dart';
// import '../vos/movies_details_vo/movie_details_vo.dart';
//
// abstract class TMDBApply {
//   ///Network
//   Future<List<MovieVO>?> getMovieListByGenresIDFromNetwork(int genreID, int page,);
//
//   Future<List<GenreVO>?> getGenresListFromNetwork();
//
//   Future<List<MovieVO>?> getTopRatedMoviesFromNetwork(int page);
//
//   Future<List<MovieVO>?> getPopularMoviesFromNetwork(int page);
//
//   Future<List<ActorVO>?> getActorFromNetwork(int page);
//
//   Future<ActorDetailsVO?> getActorDetailsFromNetwork(int actorID);
//
//   Future<List<MovieVO>?> getSearchMoviesFromNetwork(int page, String query);
//
//   Future<MovieDetailsVO?> getMoviesDetailsFromNetwork(int movieID);
//
//   Future<List<CastVO>?> getCastFromNetwork(int movieID);
//
//   Future<List<CrewVO>?> getCrewFromNetwork(int movieID);
//
//   Future<List<MovieVO>?> getSimilarMoviesFromNetwork(int movieID, int page);
//
//   ///Database
//   Stream<List<MovieVO>?> getMovieListByGenresIDFromDataBase();
//
//   Stream<List<GenreVO>?> getGenresListFromDataBase();
//
//   Stream<List<MovieVO>?> getTopRatedMoviesFromDataBase();
//
//   Stream<List<MovieVO>?> getPopularMoviesFromDataBase();
//
//   Stream<List<ActorVO>?> getActorFromDataBase();
//
//   Stream<ActorDetailsVO?> getActorDetailsFromDataBase(int actorID);
//
//   Stream<MovieDetailsVO?> getMovieDetailsFromDataBase(int movieID);
//
//   Stream<List<CastVO>?> getCastFromDataBase();
//
//   Stream<List<CrewVO>?> getCrewFromDataBase();
//
//   Stream<List<MovieVO>?> getSimilarMoviesFromDataBase();
//
//   void save(String query);
//
//   List<String>? getSearchBarStringList();
//
//   String getGenresListByID(List<int> genresID);
//
//   //Clear Box
//   void clearMoviesBox();
//
//   void clearBoxByMoviesByGenresID();
//
//   void clearActorBox();
//
//   void clearGenreBox();
//
//   void clearSimilarMovies();
// }

import 'package:movies_database/data/vos/actor_details_vo/actor_details_vo.dart';
import 'package:movies_database/data/vos/actor_vo/actor_vo.dart';

import '../vos/credit_vo/cast_vo/cast_vo.dart';
import '../vos/credit_vo/cast_vo/crew_vo.dart';
import '../vos/genre_vo/genre_vo.dart';
import '../vos/movie_vo/movie_vo.dart';
import '../vos/movies_details_vo/movie_details_vo.dart';

abstract class MovieDatabaseApply {
  /// From Network
  Future<List<MovieVO>?> getSearchMoviesFromNetwork(int page, String query);

  Future<List<MovieVO>?> getMovieListByGenresIDFromNetwork(
      int genreID, int page);

  Future<List<GenreVO>?> getGenresListFromNetwork();

  Future<List<MovieVO>?> getTopRatedMoviesFromNetwork(int page);

  Future<List<MovieVO>?> getPopularMoviesFromNetwork(int page);

  Future<List<ActorVO>?> getActorListFromNetwork(int page);

  Future<ActorDetailsVO?> getActorDetailsVO(int actorID);

  Future<MovieDetailsVO?> getMovieDetailsVoFromNetwork(int movieID);

  Future<List<CastVO>?> getCastListFromNetWork(int movieID);

  Future<List<CrewVO>?> getCrewListFromNetWork(int movieID);

  Future<List<MovieVO>?> getSimilarMoviesListFromNetWork(int page, int movieID);

  /// From DataBase
  void save(String query);

  List<String>? getSearchBarStringList();

  Stream<List<MovieVO>?> getMovieListByGenresIDFromDataBase();

  Stream<List<GenreVO>?> getGenresListFromDataBase();

  String getGenreListByID(List<int> genresID);

  Stream<List<MovieVO>?> getTopRatedMoviesFromDataBaseStream();

  Stream<List<MovieVO>?> getPopularMoviesFromDataBaseStream();

  Stream<List<ActorVO>?> getActorListFromDatabaseStream();

  Stream<ActorDetailsVO?> getActorDetailsVOFromDatabaseStream(int actorID);

  Stream<MovieDetailsVO?> getMovieDetailsVoFromDataBase(int movieID);

  Stream<List<CastVO>?> getCastListFromDatabaseStream();

  Stream<List<CrewVO>?> getCrewListFromDatabaseStream();

  Stream<List<MovieVO>?> getSimilarMoviesListFromDatabaseStream();

  ///Clear Box
  void clearMoviesBox();

  void clearGenreBox();

  void clearMoviesByGenresID();

  void clearActorBox();

  void clearSimilarMoviesBox();
}
