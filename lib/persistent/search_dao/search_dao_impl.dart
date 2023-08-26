import 'package:hive/hive.dart';
import 'package:movies_database/persistent/search_dao/search_dao.dart';
import '../../constant/hive_constant.dart';

class SearchDaoIMPL extends SearchDao {
  SearchDaoIMPL._();

  static final _singleton = SearchDaoIMPL._();

  factory SearchDaoIMPL() => _singleton;

  Box<String> _getSearchHistoryBox() =>
      Hive.box<String>(kBoxNameForSearchHistoryVO);

  @override
  List<String>? getSearchBarStringList() =>
      _getSearchHistoryBox().values.toList();

  @override
  void save(String query) {
    _getSearchHistoryBox().put(DateTime.now().millisecondsSinceEpoch, query);
  }
}
