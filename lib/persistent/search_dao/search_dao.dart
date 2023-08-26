abstract class SearchDao {
  void save(String query);

  List<String>? getSearchBarStringList();
}
