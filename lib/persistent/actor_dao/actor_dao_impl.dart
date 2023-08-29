import 'package:hive/hive.dart';

import '../../constant/hive_constant.dart';
import '../../data/vos/actor_vo/actor_vo.dart';
import 'actor_dao.dart';

class ActorDaoImpl extends ActorDAO {
  ActorDaoImpl._();

  static final ActorDaoImpl _singleton = ActorDaoImpl._();

  factory ActorDaoImpl() => _singleton;

  /// Box
  Box<ActorVO> _getActorBox() => Hive.box<ActorVO>(kBoxNameForActorVO);

  /// Database
  @override
  void save(List<ActorVO> actors) {
    for (ActorVO actorVO in actors) {
      _getActorBox().put(actorVO.id, actorVO);
    }
  }

  @override
  List<ActorVO>? getActorFromDataBase() => _getActorBox()
      .values
      .toList()
      .where((element) => element.name != null || element.profilePath != null)
      .toList();

  /// Database Stream
  @override
  Stream<List<ActorVO>?> getActorListFromDataBaseStream() =>
      Stream.value(getActorFromDataBase());

  /// watch box and clear box
  @override
  Stream watchActorBox() => _getActorBox().watch();

  @override
  void clearActorBox() => _getActorBox().clear();
}
