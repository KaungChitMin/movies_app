import 'package:hive/hive.dart';

import '../../constant/hive_constant.dart';
import '../../data/vos/credit_vo/cast_vo/crew_vo.dart';
import 'crew_dao.dart';

class CrewDAOImpl extends CrewDAO {
  CrewDAOImpl._();

  static final CrewDAOImpl _singleton = CrewDAOImpl._();

  factory CrewDAOImpl() => _singleton;

  ///Box
  Box<CrewVO> _getCrewBox() => Hive.box<CrewVO>(kBoxNameForCrewVO);

  ///Database
  @override
  void save(List<CrewVO> crewVO) {
    for (CrewVO crew in crewVO) {
      _getCrewBox().put(crew.id, crew);
    }
  }

  @override
  List<CrewVO>? getCrewList() => _getCrewBox().values.toList();

  ///Database Stream
  @override
  Stream<List<CrewVO>?> getCrewListStream() => Stream.value(getCrewList());

  ///Watch box

  @override
  Stream watchCrewBox() => _getCrewBox().watch();
}
