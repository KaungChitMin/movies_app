import 'package:flutter/material.dart';
import 'package:movies_database/data/apply/movie_database_apply.dart';
import 'package:movies_database/data/apply/movie_database_apply_impl.dart';
import 'package:movies_database/data/vos/actor_details_vo/actor_details_vo.dart';

class ActorDetailsPageBloc extends ChangeNotifier {
  final MovieDatabaseApply _apply = MovieDataBaseApplyImpl();

  bool _dispose = false;

  ActorDetailsVO? _actorDetailsVO;

  ActorDetailsVO? get getActorDetailsVO => _actorDetailsVO;

  ActorDetailsPageBloc(int actorID) {
    ///Actor Detail VO From Network
    _apply.getActorDetailsVO(actorID);

    ///Actor Details Vo on Database
    _apply.getActorDetailsVOFromDatabaseStream(actorID).listen((event) {
      if (event != null) {
        _actorDetailsVO = event;
      } else {
        _actorDetailsVO = null;
      }
      notifyListeners();
    });
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
