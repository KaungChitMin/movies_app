import 'package:hive/hive.dart';
import 'package:movies_database/constant/hive_constant.dart';
import 'package:movies_database/data/vos/movies_details_vo/movie_details_vo.dart';
import 'package:movies_database/persistent/movie_details_dao/movie_details_dao.dart';

class MovieDetailsDaoImpl extends MovieDetailsDAO {
  MovieDetailsDaoImpl._();

  static final MovieDetailsDaoImpl _singleton = MovieDetailsDaoImpl._();

  factory MovieDetailsDaoImpl() => _singleton;

  /// Box
  Box<MovieDetailsVO> _getMovieDetailsBox() =>
      Hive.box<MovieDetailsVO>(kBoxNameForActorDetailsVO);

  ///
  @override
  void save(MovieDetailsVO movieDetailsVO) {
    _getMovieDetailsBox().put(movieDetailsVO.id, movieDetailsVO);
  }

  @override
  MovieDetailsVO? getMovieDetailVOFromDatabase(int movieID) =>
      _getMovieDetailsBox().get(movieID);

  @override
  Stream<MovieDetailsVO?> getMovieDetailsVOFromDatabaseStream(int movieID) =>
      Stream.value(getMovieDetailVOFromDatabase(movieID));

  @override
  Stream watchMovieDetailsBox() => _getMovieDetailsBox().watch();
}
