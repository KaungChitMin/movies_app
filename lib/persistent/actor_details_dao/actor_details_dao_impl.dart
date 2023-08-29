import 'package:hive/hive.dart';
import 'package:movies_database/constant/hive_constant.dart';
import 'package:movies_database/data/vos/actor_details_vo/actor_details_vo.dart';
import 'package:movies_database/persistent/actor_details_dao/actor_details_dao.dart';

class ActorDetailsDAaoImpl extends ActorDetailsDAO {
  ActorDetailsDAaoImpl._();

  static final ActorDetailsDAaoImpl _singleton = ActorDetailsDAaoImpl._();

  factory ActorDetailsDAaoImpl() => _singleton;

  ///Box
  Box<ActorDetailsVO> _getActorDetailsBox() =>
      Hive.box<ActorDetailsVO>(kBoxNameForActorDetailsVO);

  /// Database
  @override
  void save(ActorDetailsVO actorDetails) {
    _getActorDetailsBox().put(actorDetails.id, actorDetails);
  }

  @override
  ActorDetailsVO? getActorDetailsListFromDataBase(int id) =>
      _getActorDetailsBox().get(id);

  ///Database Stream
  @override
  Stream<ActorDetailsVO?> getActorDetailsListFromDataBaseStream(int id) =>
      Stream.value(getActorDetailsListFromDataBase(id));

  /// Watch box and Clear box
  @override
  Stream watchActorDetailsBox() => _getActorDetailsBox().watch();

  @override
  void clearActorDetailsBox() => _getActorDetailsBox().clear();
}
