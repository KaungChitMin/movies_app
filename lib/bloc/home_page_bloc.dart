
import 'package:flutter/cupertino.dart';
import 'package:movies_database/data/apply/movie_database_apply.dart';
import 'package:movies_database/data/apply/movie_database_apply_impl.dart';

import '../data/vos/genre_vo/genre_vo.dart';
import '../data/vos/movie_vo/movie_vo.dart';

class HomePageBloc extends ChangeNotifier {
  final MovieDatabaseApply _apply = MovieDataBaseApplyImpl();

  final ScrollController _controllerForGenreMovies = ScrollController();
  final ScrollController _controllerForTopRatedMovies = ScrollController();
  final ScrollController _controllerForPopularMovies = ScrollController();

  /// State variable
  bool _isDispose = false;
  List<MovieVO>? _bannerMovieList = [];
  List<MovieVO>? _genreMovieList = [];
  List<GenreVO>? _genreMovieType = [];
  List<MovieVO>? _topRatedMoviesList = [];
  List<MovieVO>? _popularMoviesList = [];

  int _pageForGenreMovie = 1;
  int _pageForTopRatedMovie = 1;
  int _pageForPopularMovie = 1;
  int genreID = 0;

  /// Getter
  List<MovieVO>? get getBannerMovieList => _bannerMovieList;

  List<MovieVO>? get getGenreMovieList => _genreMovieList;

  List<GenreVO>? get getGenreMovieType => _genreMovieType;


  List<MovieVO>? get getTopRatedMoviesList => _topRatedMoviesList;

  List<MovieVO>? get getPopularMoviesList => _popularMoviesList;

  ScrollController get controllerForGenreMovies => _controllerForGenreMovies;

  ScrollController get getControllerForGenreMovies => _controllerForGenreMovies;

  ScrollController get controllerForTopRatedMovies => _controllerForTopRatedMovies;

  ScrollController get controllerForPopularMovies => _controllerForPopularMovies;
  /// Bloc
  HomePageBloc() {
    _apply.clearMoviesBox();
    _apply.clearGenreBox();

    /// get genre list by id from network
    _apply.getGenresListFromNetwork();

    /// get top rated movies from network
    _apply.getTopRatedMoviesFromNetwork(_pageForTopRatedMovie);

    /// get popular  movies from network
    _apply.getPopularMoviesFromNetwork(_pageForPopularMovie);

    /// listen genre list from database
    _apply.getGenresListFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _genreMovieType = event;
      }
      notifyListeners();
    });

    /// listen movies by genre id from database
    _apply.getMovieListByGenresIDFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _bannerMovieList = event.take(5).toList();
        _genreMovieList = event;
      }
      notifyListeners();
    });

    /// listen top rated movies from database
    _apply.getTopRatedMoviesFromDataBaseStream().listen((event) {
      if (event != null && event.isNotEmpty) {
             _topRatedMoviesList = event;
      } else {
        _topRatedMoviesList = [];
      }
      notifyListeners();
    });

    /// listen popular movies from database
    _apply.getPopularMoviesFromDataBaseStream().listen((event) {
      if(event!=null && event.isNotEmpty){
        _popularMoviesList = event;
      } else {
        _popularMoviesList = null;
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
      notifyListeners();
    });


    /// Listen top rated movies on scrollController
    _controllerForTopRatedMovies.addListener(() {
      if(_controllerForTopRatedMovies.position.atEdge){
        _pageForTopRatedMovie++;
        final pixel = _controllerForTopRatedMovies.position.pixels;

        if(pixel != 0){
          _apply.getTopRatedMoviesFromNetwork(_pageForTopRatedMovie);
        }
      }
    });

    /// Listen popular movies on scrollController
  _controllerForPopularMovies.addListener(() {
    if(_controllerForPopularMovies.position.atEdge){
      _pageForPopularMovie++;

      final pixel = _controllerForPopularMovies.position.pixels;
     if (pixel != 0){
       _apply.getPopularMoviesFromNetwork(_pageForPopularMovie);
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
    _isDispose = true;
    _controllerForGenreMovies.dispose();
  }


}
