import 'package:hive/hive.dart';

import '../../constant/hive_constant.dart';
import '../../data/vos/actor_details_vo/actor_details_vo.dart';
import 'actor_details_dao.dart';

class ActorDetailsDAOImpl extends ActorDetailsDAO {
  ActorDetailsDAOImpl._();

  static final ActorDetailsDAOImpl _singleton = ActorDetailsDAOImpl._();

  factory ActorDetailsDAOImpl() => _singleton;

  @override
  void clearActorDetailsBox() {
    _getActorDetailsBox().clear();
  }

  @override
  ActorDetailsVO? getActorDetailsListFromDataBase(int id) =>
      _getActorDetailsBox().get(id);

  @override
  Stream<ActorDetailsVO?> getActorDetailsListFromDataBaseStream(int id) =>
      Stream.value(getActorDetailsListFromDataBase(id));

  @override
  void save(ActorDetailsVO actor) {
    _getActorDetailsBox().put(actor.id, actor);
  }

  @override
  Stream watchActorDetailsBox() => _getActorDetailsBox().watch();

  Box<ActorDetailsVO> _getActorDetailsBox() =>
      Hive.box<ActorDetailsVO>(kBoxNameForActorDetailsVO);
}
