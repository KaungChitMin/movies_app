import 'package:hive/hive.dart';
import '../../constant/hive_constant.dart';
import '../../data/vos/actor_vo/actor_vo.dart';
import 'actor_dao.dart';

class ActorDAOImpl extends ActorDAO {
  ActorDAOImpl._();

  static final ActorDAOImpl _singleton = ActorDAOImpl._();

  factory ActorDAOImpl() => _singleton;

  @override
  List<ActorVO>? getActorFromDataBase() => _getActorBox()
      .values
      .toList()
      .where((element) => element.name != null || element.profilePath != null)
      .toList();

  @override
  Stream<List<ActorVO>?> getActorListFromDataBaseStream() =>
      Stream.value(getActorFromDataBase());

  @override
  void save(List<ActorVO> actors) {
    for (ActorVO actor in actors) {
      _getActorBox().put(actor.id, actor);
    }
  }

  @override
  Stream watchActorBox() => _getActorBox().watch();

  Box<ActorVO> _getActorBox() => Hive.box<ActorVO>(kBoxNameForActorVO);

  @override
  void clearActorBox() {
    _getActorBox().clear();
  }
}
