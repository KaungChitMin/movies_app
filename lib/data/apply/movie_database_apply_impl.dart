// import 'package:movies_database/data/vos/genre_vo/genre_vo.dart';
// import 'package:movies_database/network/data_agent/tmdb_data_agent_impl.dart';
// import 'package:movies_database/persistent/genre_dao/genre_dao.dart';
// import 'package:movies_database/persistent/genre_dao/genre_dao_impl.dart';
// import 'package:stream_transform/stream_transform.dart';
// import '../../network/data_agent/tmdb_data_agent.dart';
// import '../../persistent/movie_dao/movie_dao.dart';
// import '../../persistent/movie_dao/movie_dao_impl.dart';
// import '../../persistent/search_dao/search_dao.dart';
// import '../../persistent/search_dao/search_dao_impl.dart';
// import '../vos/movie_vo/movie_vo.dart';
// import 'movie_database_apply.dart';
//
// class MovieDatabaseApplyImpl extends MovieDatabaseApply {
//   MovieDatabaseApplyImpl._();
//
//   static final MovieDatabaseApplyImpl _singleton = MovieDatabaseApplyImpl._();
//
//   factory MovieDatabaseApplyImpl() => _singleton;
//
//   final MovieDAO _movieDAO = MovieDAOImpl();
//   final SearchDao _searchDao = SearchDaoIMPL();
//   final GenreDAO _genreDAO = GenreDaoImpl();
//   final MovieDataAgent _dataAgent = MovieDataAgentImpl();
//
//   /// Network
//   @override
//   Future<List<MovieVO>?> getSearchMoviesFromNetwork(int page, String query) =>
//       _dataAgent.getSearchMovies(page, query).then((value) => value);
//
//   @override
//   Future<List<MovieVO>?> getMovieListByGenresIDFromNetwork( int genreID, int page, {bool isDeleteAll = false}) =>
//       _dataAgent.getMovieListByGenreId(genreID, page).then((value) {
//         if (value != null) {
//           var temp = value;
//           temp = temp.map((e) {
//             e.isMoviesByGenres = true;
//             return e;
//           }).toList();
//
//           _movieDAO.save(temp);
//         }
//         return value;
//       });
//
//   @override
//   Future<List<GenreVO>?> getGenresListFromNetwork() =>
//       _dataAgent.getGenreTypeAsList().then((value) {
//         if (value != null) {
//           _genreDAO.save(value);
//           getMovieListByGenresIDFromNetwork(value.first.id ?? 0, 1);
//         }
//         return value;
//       });
//
//
//   /// Database
//   @override
//   void save(String query) => _searchDao.save(query);
//
//   @override
//   List<String>? getSearchBarStringList() => _searchDao.getSearchBarStringList();
//
//   @override
//   Stream<List<MovieVO>?> getMovieListByGenresIDFromDataBase() {
//     return _movieDAO
//         .watchMovieBox()
//         .startWith(_movieDAO.getMovieListByGenreIDFromDataBaseStream())
//         .map((event) => _movieDAO.getMovieListByGenreIDFromDataBase());
//   }
//
//   @override
//   Stream<List<GenreVO>?> getGenresListFromNetworkFromDataBase() {
//     return _genreDAO
//         .watchGenreBox()
//         .startWith(_genreDAO.getGenreListFromDataBaseStream())
//         .map((event) => _genreDAO.getGenreListFromDataBase());
//   }
//
//   @override
//   String getGenresListByID(List<int> genresID) =>
//       _genreDAO.getGenresListByID(genresID);
//
//   /// Clear Box
//   @override
//   void clearMoviesBox() {
//     _movieDAO.clearMoviesBox();
//   }
//
//   @override
//   void clearGenreBox() {
//     _genreDAO.clearGenreBox();
//   }
//
//   @override
//   void clearBoxByMoviesByGenresID() {
//     _movieDAO.clearBoxByMoviesByGenresID();
//   }
//
//
//
//
//
// }

import 'package:movies_database/data/vos/genre_vo/genre_vo.dart';
import 'package:movies_database/data/vos/movie_vo/movie_vo.dart';
import 'package:movies_database/network/data_agent/tmdb_data_agent.dart';
import 'package:movies_database/network/data_agent/tmdb_data_agent_impl.dart';
import 'package:movies_database/persistent/genre_dao/genre_dao.dart';
import 'package:movies_database/persistent/genre_dao/genre_dao_impl.dart';
import 'package:movies_database/persistent/movie_dao/movie_dao_impl.dart';
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
  final MovieDAO _movieDao = MovieDaoImpl();
  final SearchDao _searchDao = SearchDaoIMPL();
  final GenreDAO _genreDAO = GenreDaoImpl();

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
          _genreDAO.save(value);
          getMovieListByGenresIDFromNetwork(value.first.id ?? 0, 1);
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
  Stream<List<GenreVO>?> getGenresListFromNetworkFromDataBase() {
    return _genreDAO
        .watchGenreBox()
        .startWith(_genreDAO.getGenreListFromDataBaseStream())
        .map((event) => _genreDAO.getGenreListFromDataBase());
  }

  @override
  String getGenreListByID(List<int> genresID) =>
      _genreDAO.getGenresListByID(genresID);

  /// clear movie box

  @override
  void clearMoviesBox() {
    _movieDao.clearMoviesBox();
  }

  @override
  void clearGenreBox() {
    _genreDAO.clearGenreBox();
  }

  @override
  void clearMoviesByGenresID() {
    _movieDao.clearMoviesByGenresID();
  }

}
