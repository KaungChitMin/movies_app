import 'package:flutter/cupertino.dart';
import 'package:movies_database/data/apply/movie_database_apply.dart';
import 'package:movies_database/data/apply/movie_database_apply_impl.dart';
import 'package:movies_database/data/vos/credit_vo/cast_vo/cast_vo.dart';
import 'package:movies_database/data/vos/credit_vo/cast_vo/crew_vo.dart';
import 'package:movies_database/data/vos/movie_vo/movie_vo.dart';
import 'package:movies_database/data/vos/movies_details_vo/movie_details_vo.dart';

class DetailsPageBLoc extends ChangeNotifier {
  final MovieDatabaseApply _apply = MovieDataBaseApplyImpl();

  final ScrollController _controllerForSimilarMovies = ScrollController();

  /// State Variable
  bool _isDispose = false;
  MovieDetailsVO? _movieDetailsVO;
  List<CastVO>? _castList = [];
  List<CrewVO>? _crewList = [];
  List<MovieVO>? _similarMoviesList = [];

  int _pageForSimilarMovies = 1;

  /// Getter
  MovieDetailsVO? get getMovieDetailsVO => _movieDetailsVO;

  List<CrewVO>? get getCrewList => _crewList;

  List<MovieVO>? get getSimilarMoviesList => _similarMoviesList;

  List<CastVO>? get getCastList => _castList;

  ScrollController get getControllerForSimilarMovies =>
      _controllerForSimilarMovies;

  /// Bloc
  DetailsPageBLoc(int movieID) {
    ///Movie Detail Vo From Network
    _apply.getMovieDetailsVoFromNetwork(movieID);

    ///Listen Movie Details Vo On Database
    _apply.getMovieDetailsVoFromDataBase(movieID).listen((event) {
      if (event != null) {
        _movieDetailsVO = event;
      } else {
        _movieDetailsVO = null;
      }
      notifyListeners();
    });

    ///Get Cast List From NetWork
    _apply.getCastListFromNetWork(movieID);

    ///Get Crew List From NetWork
    _apply.getCrewListFromNetWork(movieID);

    ///Get Similar movies From Network
    _apply.getSimilarMoviesListFromNetWork(_pageForSimilarMovies, movieID);

    ///Listen Cast List On Database
    _apply.getCastListFromDatabaseStream().listen((event) {
      if (event != null) {
        _castList = event;
      } else if (event == null) {
        _castList = null;
      } else {
        _castList = [];
        notifyListeners();
      }
    });

    ///Listen Crew List on Database
    _apply.getCrewListFromDatabaseStream().listen((event) {
      if (event != null) {
        _crewList = event;
      } else if (event == null) {
        _crewList = null;
      } else {
        _crewList = [];
      }
      notifyListeners();
    });

    ///Listen Similar Movies on Database
    _apply.getSimilarMoviesListFromDatabaseStream().listen((event) {
      if (event != null) {
        _similarMoviesList = event;
      } else if (event == null) {
        _similarMoviesList = null;
      } else {
        _similarMoviesList = [];
      }
      notifyListeners();
    });

    ///Similar movies list on ScrollController
    _controllerForSimilarMovies.addListener(() {
      if (_controllerForSimilarMovies.position.atEdge) {
        _pageForSimilarMovies++;
        final pixels = _controllerForSimilarMovies.position.pixels;

        if (pixels != 0) {
          _apply.getSimilarMoviesListFromNetWork(
              _pageForSimilarMovies, movieID);
        }
      }
      notifyListeners();
    });
  }

  @override
  void notifyListeners() {
    if (!_isDispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _isDispose = true;
  }
}


