import 'package:hive/hive.dart';

import '../../constant/hive_constant.dart';
import '../../data/vos/genre_vo/genre_vo.dart';
import 'genre_dao.dart';

class GenreDaoImpl extends GenreDAO {
  /// Box
  Box<GenreVO> _genreBox() => Hive.box<GenreVO>(kBoxNameForGenreVO);

  ///
  @override
  void save(List<GenreVO> genreList) {
    for (GenreVO genreVo in genreList) {
      _genreBox().put(genreVo.id, genreVo);
    }
  }

  @override
  List<GenreVO>? getGenreListFromDataBase() {
    final genreList = _genreBox().values.toList();
    if (genreList.isNotEmpty) {
      final temp = genreList.first;
      genreList.removeAt(0);
      temp.isSelect = true;
      genreList.insert(0, temp);
    }
    return genreList;
  }

  @override
  Stream<List<GenreVO>?> getGenreListFromDataBaseStream() =>
      Stream.value(getGenreListFromDataBase());

  @override
  String getGenresListByID(List<int> genreID) {
    final List<String> result = [];
    final genreList = _genreBox().values.toList();
    for (var firstId in genreID) {
      for (var secondId in genreList) {
        if (firstId == secondId.id) {
          result.add(secondId.name ?? '');
        }
      }
    }
    return result.join("");
  }

  @override
  Stream watchGenreBox() => _genreBox().watch();

  @override
  void clearGenreBox() => _genreBox().clear();
}
