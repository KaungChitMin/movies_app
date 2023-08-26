
import '../../data/vos/credit_vo/cast_vo/crew_vo.dart';

abstract class CrewDAO {
  Stream watchCrewBox();

  Stream<List<CrewVO>?> getCrewListStream();

  List<CrewVO>? getCrewList();

  void save(List<CrewVO> crewVO);
}
