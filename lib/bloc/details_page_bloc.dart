import 'package:flutter/cupertino.dart';
import 'package:movies_database/data/apply/movie_database_apply.dart';
import 'package:movies_database/data/apply/movie_database_apply_impl.dart';
import 'package:movies_database/data/vos/movies_details_vo/movie_details_vo.dart';

class DetailsPageBLoc extends ChangeNotifier {
  final MovieDatabaseApply _apply = MovieDataBaseApplyImpl();

  /// State Variable
  bool _isDispose = false;
  MovieDetailsVO? _movieDetailsVO;

  /// Getter
  MovieDetailsVO? get getMovieDetailsVO => _movieDetailsVO;

  /// Bloc
  DetailsPageBLoc(int movieID) {
    /// Movie Detail Vo From Network
    _apply.getMovieDetailsVoFromNetwork(movieID);

    /// Listen Movie Details Vo On Database
    _apply.getMovieDetailsVoFromDataBase(movieID).listen((event) {
      if (event != null) {
        _movieDetailsVO = event;
      } else {
        _movieDetailsVO = null;
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

// import 'package:flutter/material.dart';
// import '../data/apply/movie_database_apply.dart';
// import '../data/apply/movie_database_apply_impl.dart';
// import '../data/vos/credit_vo/cast_vo/cast_vo.dart';
// import '../data/vos/credit_vo/cast_vo/crew_vo.dart';
// import '../data/vos/movie_vo/movie_vo.dart';
// import '../data/vos/movies_details_vo/movie_details_vo.dart';
//
// class DetailsPageBloc extends ChangeNotifier {
//   final MovieDatabaseApply _tmdbApply = MovieDataBaseApplyImpl();
//
//   final ScrollController _scrollControllerForSimilarMovies = ScrollController();
//   bool _dispose = false;
//   MovieDetailsVO? _movieDetailsVO;
//   List<CastVO>? _castList;
//   List<CrewVO>? _crewList;
//   List<MovieVO>? _similarMoviesList;
//   int _pageCountForSimilarMovies = 1;
//
//   MovieDetailsVO? get getMoviesDetailsVO => _movieDetailsVO;
//
//   List<CastVO>? get getCastVO => _castList;
//
//   List<CrewVO>? get getCrewVO => _crewList;
//
//   List<MovieVO>? get getSimilarMovieList => _similarMoviesList;
//
//   ScrollController get getScrollControllerForSimilarMovies =>
//       _scrollControllerForSimilarMovies;
//
//   DetailsPageBloc(int movieID) {
//     ///Clear Previous Similar movies
//     _tmdbApply.clearSimilarMoviesBox();
//
//     ///Fetch Movie Details By ID From Network
//     _tmdbApply.getMovieDetailsVoFromNetwork(movieID);
//
//     ///Fetch Actor By ID From Network
//     _tmdbApply.getCastList(movieID);
//
//     ///Fetch Crew By ID From Network
//     _tmdbApply.getCrewList(movieID);
//
//     ///Fetch Similar Movies From Network
//     _tmdbApply.getSimilarMoviesList(movieID, _pageCountForSimilarMovies);
//
//     ///Listen Movie Details By ID From DataBase
//     _tmdbApply.getMovieDetailsVoFromDataBase(movieID).listen((event) {
//       if (event != null) {
//         _movieDetailsVO = event;
//       } else {
//         _movieDetailsVO = null;
//       }
//       notifyListeners();
//     });
//
//     ///Listen Cast From DataBase
//     _tmdbApply.getCastListFromDatabaseStream().listen((event) {
//       if (event != null) {
//         _castList = event;
//       } else if (event == null) {
//         _castList = null;
//       } else {
//         _castList = [];
//       }
//       notifyListeners();
//     });
//
//     ///Listen Crew From DataBase
//     _tmdbApply.getCrewListFromDatabaseStream().listen((event) {
//       if (event != null) {
//         _crewList = event;
//       } else if (event == null) {
//         _crewList = null;
//       } else {
//         _crewList = [];
//       }
//       notifyListeners();
//     });
//
//     ///Listen Similar Movies From DataBase
//     _tmdbApply.getSimilarMoviesListFromDatabaseStream().listen((event) {
//       if (event != null) {
//         _similarMoviesList = event;
//       } else if (event == null) {
//         _similarMoviesList = null;
//       } else {
//         _similarMoviesList = [];
//       }
//       notifyListeners();
//     });
//
//     ///Listen Scrolling for Similar Movies
//     _scrollControllerForSimilarMovies.addListener(() {
//       if (_scrollControllerForSimilarMovies.position.atEdge) {
//         _pageCountForSimilarMovies++;
//         final pixels = _scrollControllerForSimilarMovies.position.pixels;
//         if (pixels != 0) {
//           _tmdbApply.getSimilarMoviesList(movieID, _pageCountForSimilarMovies);
//         }
//       }
//     });
//   }
//
//   @override
//   void notifyListeners() {
//     if (!_dispose) {
//       super.notifyListeners();
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _dispose = true;
//     _scrollControllerForSimilarMovies.dispose();
//   }
// }
