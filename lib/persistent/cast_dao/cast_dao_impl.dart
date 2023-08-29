import 'package:hive/hive.dart';

import '../../constant/hive_constant.dart';
import '../../data/vos/credit_vo/cast_vo/cast_vo.dart';
import 'cast_dao.dart';

class CastDAOImpl extends CastDAO {
  CastDAOImpl._();

  static final CastDAOImpl _singleton = CastDAOImpl._();

  factory CastDAOImpl() => _singleton;

  ///Box
  Box<CastVO> _getCastBox() => Hive.box<CastVO>(kBoxNameForCastVO);

  ///Database
  @override
  void save(List<CastVO> castVO) {
    for (CastVO cast in castVO) {
      _getCastBox().put(cast.id, cast);
    }
  }

  @override
  List<CastVO>? getCastList() => _getCastBox().values.toList();

  ///Database Stream
  @override
  Stream<List<CastVO>?> getCastListStream() => Stream.value(getCastList());

  ///Watch box
  @override
  Stream watchCastBox() => _getCastBox().watch();
}
