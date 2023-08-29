import '../../data/vos/credit_vo/cast_vo/crew_vo.dart';

abstract class CrewDAO {
  void save(List<CrewVO> crewVO);

  Stream<List<CrewVO>?> getCrewListStream();

  List<CrewVO>? getCrewList();

  Stream watchCrewBox();
}
