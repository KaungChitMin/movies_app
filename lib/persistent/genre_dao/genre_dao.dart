
import '../../data/vos/genre_vo/genre_vo.dart';

abstract class GenreDAO {
  void save(List<GenreVO> genre);

  List<GenreVO>? getGenreListFromDataBase();

  Stream<List<GenreVO>?> getGenreListFromDataBaseStream();

  String getGenresListByID(List<int> genreID);

  Stream watchGenreBox();

  void clearGenreBox();


}
