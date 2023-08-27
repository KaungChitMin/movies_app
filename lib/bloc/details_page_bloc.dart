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
