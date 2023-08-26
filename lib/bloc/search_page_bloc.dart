import 'package:flutter/cupertino.dart';
import 'package:movies_database/data/apply/movie_database_apply.dart';
import 'package:movies_database/data/apply/movie_database_apply_impl.dart';
import '../data/vos/movie_vo/movie_vo.dart';

class SearchPageBloc extends ChangeNotifier {
  final MovieDatabaseApply _apply = MovieDataBaseApplyImpl();
  final ScrollController _searchMoviesScrollController = ScrollController();

  /// State Variable

  List<String>? _searchBarListString;
  List<MovieVO>? _searchMoviesList;
  String _query = " ";
  bool _isSearching = false;
  int _pageCount = 1;
  bool _isDispose = false;

  /// Getter

  ScrollController get getSearchMoviesListSC => _searchMoviesScrollController;

  List<String>? get getSearchBarString => _searchBarListString;

  List<MovieVO>? get getSearchMoviesList => _searchMoviesList;

  String get query => _query;

  bool get getIsSearching => _isSearching;

  /// BLoc
  SearchPageBloc() {
    /// Search Movie from Scroll Controller
    final searchList = _apply.getSearchBarStringList();

    if (searchList == null) {
      _searchBarListString = null;
    } else if (searchList.isEmpty) {
      _searchBarListString = [];
    } else {
      _searchBarListString = searchList;
    }
    notifyListeners();

    /// getting list movies vo from  scrollController
    _searchMoviesScrollController.addListener(() {
      if (_searchMoviesScrollController.position.atEdge) {
        _pageCount++;
        final pixels = _searchMoviesScrollController.position.pixels;

        if (pixels != 0) {
          _apply.getSearchMoviesFromNetwork(_pageCount, query).then((value) {
            if (value != null) {
              for (var movies in value) {
                _searchMoviesList?.add(movies);
              }
              _searchMoviesList = _searchMoviesList?.map((e) => e).toList();
              notifyListeners();
            }
          });
        }
      }
    });
  }

  void searchText(text) {
    _query = text;
    _isSearching = true;
    notifyListeners();

    _apply.getSearchMoviesFromNetwork(_pageCount, query).then((value) {
      _searchMoviesList = value;
      notifyListeners();
    }).whenComplete(() {
      _isSearching = false;
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
    _searchMoviesScrollController.dispose();
  }
}
