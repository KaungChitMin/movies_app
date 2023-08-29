import '../../../data/vos/actor_vo/actor_vo.dart';

abstract class ActorDAO {
  void save(List<ActorVO> actors);

  List<ActorVO>? getActorFromDataBase();

  Stream<List<ActorVO>?> getActorListFromDataBaseStream();

  Stream watchActorBox();

  void clearActorBox();
}
