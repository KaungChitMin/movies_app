import 'package:flutter/cupertino.dart';
import 'package:movies_database/data/apply/movie_database_apply.dart';
import 'package:movies_database/data/apply/movie_database_apply_impl.dart';

import '../data/vos/genre_vo/genre_vo.dart';
import '../data/vos/movie_vo/movie_vo.dart';

class HomePageBloc extends ChangeNotifier {
  final MovieDatabaseApply _apply = MovieDataBaseApplyImpl();

  final ScrollController _controllerForGenreMovies = ScrollController();

  /// State variable
  final bool _isDispose = false;
  List<MovieVO>? _bannerMovieList = [];
  List<MovieVO>? _genreMovieList = [];
  List<GenreVO>? _genreMovieType = [];

  ScrollController get getControllerForGenreMovies => _controllerForGenreMovies;

  /// Getter
  List<MovieVO>? get getBannerMovieList => _bannerMovieList;

  List<MovieVO>? get getGenreMovieList => _genreMovieList;

  List<GenreVO>? get getGenreMovieType => _genreMovieType;

  ///
  int _pageForGenreMovie = 1;
  int genreID = 0;

  /// Bloc
  HomePageBloc() {
    /// get genre list by id from network
    _apply.getGenresListFromNetwork();

    /// listen genre list from database
    _apply.getGenresListFromNetworkFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _genreMovieType = event;
      }
      notifyListeners();
    });

    /// listen movies by genre id from database
    _apply.getMovieListByGenresIDFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _bannerMovieList = event.take(10).toList();
        _genreMovieList = event;
      }
      notifyListeners();
    });

    /// Listen movies by genreId on scrollController
    _controllerForGenreMovies.addListener(() {
      if (_controllerForGenreMovies.position.atEdge) {
        _pageForGenreMovie++;
        final pixel = _controllerForGenreMovies.position.pixels;
        if (pixel != 0) {
          _apply.getMovieListByGenresIDFromNetwork(genreID, _pageForGenreMovie);
        }
      }
    });
  }

  void genreTitleSelect(int selectId) {
    _apply.clearMoviesByGenresID();
    genreID = selectId;
    _genreMovieType = _genreMovieType?.map((e) {
      if (genreID == e.id) {
        e.isSelect = true;
      } else {
        e.isSelect = false;
      }
      return e;
    }).toList();
    _genreMovieType = _genreMovieType?.map((e) => e).toList();
    _apply.getMovieListByGenresIDFromNetwork(genreID, _pageForGenreMovie);
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
    _controllerForGenreMovies.dispose();
  }
}
