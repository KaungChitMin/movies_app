import 'package:flutter/material.dart';
import 'package:movies_database/bloc/details_page_bloc.dart';
import 'package:movies_database/constant/dimens.dart';
import 'package:movies_database/constant/strings.dart';
import 'package:movies_database/data/vos/credit_vo/cast_vo/cast_vo.dart';
import 'package:movies_database/data/vos/credit_vo/cast_vo/crew_vo.dart';
import 'package:movies_database/widgets/easy_text_widget.dart';
import 'package:movies_database/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/cast_and_crew_profile_widget.dart';

class CastListView extends StatelessWidget {
  const CastListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<DetailsPageBLoc, List<CastVO>?>(
        selector: (_, bloc) => bloc.getCastList,
        builder: (_, castList, __) => castList == null
            ? const Center(child: LoadingWidget())
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Star cast Title
                  const Padding(
                    padding: EdgeInsets.only(left: kSP10x, bottom: kSP20x),
                    child: EasyText(
                      text: kStarCastText,
                      fontSize: kSP20x,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  ///Image, Gender And Actor Name

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: castList
                          .map((e) => CastAndCrewImageNameWidget(
                                imageUrl: e.profilePath ?? '',
                                actorName: e.name ?? '',
                                gender: e.getGenderByActor(),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ));
  }
}

class CrewListVIew extends StatelessWidget {
  const CrewListVIew({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<DetailsPageBLoc, List<CrewVO>?>(
        selector: (_, bloc) => bloc.getCrewList,
        builder: (_, crewList, __) => crewList == null
            ? const Center(child: LoadingWidget())
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Crew Title
                  const Padding(
                    padding: EdgeInsets.only(left: kSP10x, bottom: kSP20x),
                    child: EasyText(
                      text: kTalentSquadText,
                      fontSize: kSP20x,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  ///Image, Gender And Actor Name

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: crewList
                          .map((e) => SizedBox(
                                height: kSP80x,
                                child: CastAndCrewImageNameWidget(
                                  imageUrl: e.profilePath ?? '',
                                  actorName: e.name ?? '',
                                  gender: e.job ?? '',
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ));
  }
}
