import '../../data/vos/credit_vo/cast_vo/cast_vo.dart';

abstract class CastDAO {
  void save(List<CastVO> castVO);

  Stream<List<CastVO>?> getCastListStream();

  List<CastVO>? getCastList();

  Stream watchCastBox();
}
