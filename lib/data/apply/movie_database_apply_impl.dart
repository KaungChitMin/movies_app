import 'package:movies_database/data/vos/actor_details_vo/actor_details_vo.dart';
import 'package:movies_database/data/vos/actor_vo/actor_vo.dart';
import 'package:movies_database/data/vos/credit_vo/cast_vo/cast_vo.dart';
import 'package:movies_database/data/vos/credit_vo/cast_vo/crew_vo.dart';
import 'package:movies_database/data/vos/genre_vo/genre_vo.dart';
import 'package:movies_database/data/vos/movie_vo/movie_vo.dart';
import 'package:movies_database/data/vos/movies_details_vo/movie_details_vo.dart';
import 'package:movies_database/network/data_agent/tmdb_data_agent.dart';
import 'package:movies_database/network/data_agent/tmdb_data_agent_impl.dart';
import 'package:movies_database/persistent/actor_dao/actor_dao.dart';
import 'package:movies_database/persistent/actor_dao/actor_dao_impl.dart';
import 'package:movies_database/persistent/actor_details_dao/actor_details_dao.dart';
import 'package:movies_database/persistent/actor_details_dao/actor_details_dao_impl.dart';
import 'package:movies_database/persistent/cast_dao/cast_dao.dart';
import 'package:movies_database/persistent/cast_dao/cast_dao_impl.dart';
import 'package:movies_database/persistent/crew_dao/crew_dao.dart';
import 'package:movies_database/persistent/crew_dao/crew_dao_impl.dart';
import 'package:movies_database/persistent/genre_dao/genre_dao.dart';
import 'package:movies_database/persistent/genre_dao/genre_dao_impl.dart';
import 'package:movies_database/persistent/movie_dao/movie_dao_impl.dart';
import 'package:movies_database/persistent/movie_details_dao/movie_details_dao.dart';
import 'package:movies_database/persistent/movie_details_dao/movie_details_dao_impl.dart';
import 'package:movies_database/persistent/search_dao/search_dao.dart';
import 'package:movies_database/persistent/search_dao/search_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../persistent/movie_dao/movie_dao.dart';
import 'movie_database_apply.dart';

class MovieDataBaseApplyImpl extends MovieDatabaseApply {
  MovieDataBaseApplyImpl._();

  static final MovieDataBaseApplyImpl _singleton = MovieDataBaseApplyImpl._();

  factory MovieDataBaseApplyImpl() => _singleton;

  final MovieDataAgent _dataAgent = MovieDataAgentImpl();
  final SearchDao _searchDao = SearchDaoIMPL();
  final MovieDAO _movieDao = MovieDaoImpl();
  final GenreDAO _genreDao = GenreDaoImpl();
  final ActorDAO _actorDao = ActorDaoImpl();
  final ActorDetailsDAO _actorDetailsDao = ActorDetailsDAaoImpl();
  final CastDAO _castDao = CastDAOImpl();
  final CrewDAO _crewDao = CrewDAOImpl();
  final MovieDetailsDAO _movieDetailsDao = MovieDetailsDaoImpl();

  /// Network
  @override
  Future<List<MovieVO>?> getSearchMoviesFromNetwork(int page, String query) =>
      _dataAgent.getSearchMovies(page, query).then((value) => value);

  @override
  Future<List<MovieVO>?> getMovieListByGenresIDFromNetwork(
          int genreID, int page) =>
      _dataAgent.getMovieListByGenreId(genreID, page).then((value) {
        if (value != null) {
          var temp = value.map((e) {
            e.isMoviesByGenres = true;
            return e;
          }).toList();
          _movieDao.save(temp);
        }
        return value;
      });

  @override
  Future<List<GenreVO>?> getGenresListFromNetwork() =>
      _dataAgent.getGenreTypeAsList().then((value) {
        if (value != null) {
          _genreDao.save(value);
          getMovieListByGenresIDFromNetwork(value.first.id ?? 0, 1);
        }
        return value;
      });

  @override
  Future<List<MovieVO>?> getTopRatedMoviesFromNetwork(int page) =>
      _dataAgent.getTopRattedMovies(page).then((value) {
        if (value != null) {
          var temp = value;
          temp = temp.map((e) {
            e.isGetNowPlaying = true;
            return e;
          }).toList();
          _movieDao.save(temp);
        }
        return value;
      });

  @override
  Future<List<MovieVO>?> getPopularMoviesFromNetwork(int page) =>
      _dataAgent.getPopularMovies(page).then((value) {
        if (value != null) {
          var temp = value;
          temp = temp.map((e) {
            e.isPopularMovies = true;
            return e;
          }).toList();
          _movieDao.save(temp);
        }
        return value;
      });

  @override
  Future<List<ActorVO>?> getActorListFromNetwork(int page) =>
      _dataAgent.getActorList(page).then((value) {
        if (value != null) {
          _actorDao.save(value);
        }
        return value;
      });

  @override
  Future<ActorDetailsVO?> getActorDetailsVO(int actorID) =>
      _dataAgent.getActorDetailsVo(actorID).then((value) {
        if (value != null) {
          _actorDetailsDao.save(value);
        }
        return value;
      });

  @override
  Future<MovieDetailsVO?> getMovieDetailsVoFromNetwork(int movieID) =>
      _dataAgent.getMovieDetailsVO(movieID).then((value) {
        if (value != null) {
          _movieDetailsDao.save(value);
        }
        return value;
      });

  @override
  Future<List<CastVO>?> getCastListFromNetWork(int movieID) =>
      _dataAgent.getCastList(movieID).then((value) {
        if (value != null) {
          _castDao.save(value);
        }
        return value;
      });

  @override
  Future<List<CrewVO>?> getCrewListFromNetWork(int movieID) =>
      _dataAgent.getCrewList(movieID).then((value) {
        if (value != null) {
          _crewDao.save(value);
        }
        return value;
      });

  @override
  Future<List<MovieVO>?> getSimilarMoviesListFromNetWork(int page, int movieID) =>
      _dataAgent.getSimilarMoviesList(page, movieID).then((value) {
        if (value != null) {
          var temp = value;
          temp = temp.map((e) {
            e.isSimilarMovies = true;
            return e;
          }).toList();
          _movieDao.save(value);
        }
        return value;
      });

  ///  Database
  @override
  void save(String query) {
    _searchDao.save(query);
  }

  @override
  List<String>? getSearchBarStringList() => _searchDao.getSearchBarStringList();

  @override
  Stream<List<MovieVO>?> getMovieListByGenresIDFromDataBase() {
    return _movieDao
        .watchMovieBox()
        .startWith(_movieDao.getMovieListByGenreIDFromDataBaseStream())
        .map((event) => _movieDao.getMovieListByGenreIDFromDataBase());
  }

  @override
  Stream<List<GenreVO>?> getGenresListFromDataBase() {
    return _genreDao
        .watchGenreBox()
        .startWith(_genreDao.getGenreListFromDataBaseStream())
        .map((event) => _genreDao.getGenreListFromDataBase());
  }

  @override
  String getGenreListByID(List<int> genresID) =>
      _genreDao.getGenresListByID(genresID);

  @override
  Stream<List<MovieVO>?> getTopRatedMoviesFromDataBaseStream() {
    return _movieDao
        .watchMovieBox()
        .startWith(_movieDao.getTopRatedMoviesFromDatabaseStream())
        .map((event) => _movieDao.getTopRatedMoviesFromDatabase());
  }

  @override
  Stream<List<MovieVO>?> getPopularMoviesFromDataBaseStream() {
    return _movieDao
        .watchMovieBox()
        .startWith(_movieDao.getPopularMoviesFromDatabaseStream())
        .map((event) => _movieDao.getPopularMoviesFromDatabase());
  }

  @override
  Stream<List<ActorVO>?> getActorListFromDatabaseStream() {
    return _actorDao
        .watchActorBox()
        .startWith(_actorDao.getActorListFromDataBaseStream())
        .map((event) => _actorDao.getActorFromDataBase());
  }

  @override
  Stream<ActorDetailsVO?> getActorDetailsVOFromDatabaseStream(int actorID) {
    return _actorDetailsDao
        .watchActorDetailsBox()
        .startWith(
            _actorDetailsDao.getActorDetailsListFromDataBaseStream(actorID))
        .map((event) =>
            _actorDetailsDao.getActorDetailsListFromDataBase(actorID));
  }

  @override
  Stream<MovieDetailsVO?> getMovieDetailsVoFromDataBase(int movieID) =>
      _movieDetailsDao
          .watchMovieDetailsBox()
          .startWith(
              _movieDetailsDao.getMovieDetailsVOFromDatabaseStream(movieID))
          .map((event) =>
              _movieDetailsDao.getMovieDetailVOFromDatabase(movieID));

  @override
  Stream<List<CastVO>?> getCastListFromDatabaseStream() {
    return _castDao
        .watchCastBox()
        .startWith(_castDao.getCastListStream())
        .map((event) => _castDao.getCastList());
  }

  @override
  Stream<List<CrewVO>?> getCrewListFromDatabaseStream() {
    return _crewDao
        .watchCrewBox()
        .startWith(_crewDao.getCrewListStream())
        .map((event) => _crewDao.getCrewList());
  }

  @override
  Stream<List<MovieVO>?> getSimilarMoviesListFromDatabaseStream() {
    return _movieDao
        .watchMovieBox()
        .startWith(_movieDao.getSimilarMoviesFromDatabaseStream())
        .map((event) => _movieDao.getSimilarMoviesFromDatabase());
  }

  /// clear movie box

  @override
  void clearMoviesBox() {
    _movieDao.clearMoviesBox();
  }

  @override
  void clearGenreBox() {
    _genreDao.clearGenreBox();
  }

  @override
  void clearMoviesByGenresID() {
    _movieDao.clearMoviesByGenresID();
  }

  @override
  void clearActorBox() {
    _actorDao.clearActorBox();
  }

  @override
  void clearSimilarMoviesBox() {
    _movieDao.clearSimilarMoviesBox();
  }
}
