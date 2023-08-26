
import '../../data/vos/credit_vo/cast_vo/cast_vo.dart';

abstract class CastDAO {
  Stream watchCastBox();

  Stream<List<CastVO>?> getCastListStream();

  List<CastVO>? getCastList();

  void save(List<CastVO> castVO);
}
