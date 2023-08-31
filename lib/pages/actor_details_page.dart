import 'package:flutter/material.dart';
import 'package:movies_database/bloc/actor_details_bloc.dart';
import 'package:movies_database/data/vos/actor_details_vo/actor_details_vo.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import 'package:movies_database/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../view_items/actor_details_page_view_items/actor_details_image_view.dart';
import '../view_items/actor_details_page_view_items/biography_view.dart';
import '../view_items/actor_details_page_view_items/more_actor_info_widget.dart';

class ActorDetailsPage extends StatelessWidget {
  const ActorDetailsPage({super.key, required this.actorID});

  final int actorID;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ActorDetailsPageBloc(actorID),
        child: Selector<ActorDetailsPageBloc, ActorDetailsVO?>(
            selector: (_, bloc) => bloc.getActorDetailsVO,
            builder: (_, actorDetails, __) => actorDetails == null
                ? const Center(
                    child: LoadingWidget(),
                  )
                : NestedScrollView(
                    headerSliverBuilder: (context, _) => [
                          ActorDetailsImageView(
                            actorName: actorDetails.name ?? '',
                            onTapBack: () {
                              context.navigateBack(context);
                            },
                            profileImage: actorDetails.profilePath ?? '',
                          )
                        ],
                    body: ListView(
                      children: [
                        ///Actor Biography
                        BiographyItemView(
                          biography: actorDetails.biography ?? '',
                        ),

                        ///Actor More Info
                        MoreActorInfoWidget(
                          gender: actorDetails.getGender(),
                          birthDay: actorDetails.birthday ?? '',
                          deadDay: actorDetails.deathDay ?? '',
                          placeOfBirth: actorDetails.placeOfBirth ?? '',
                          popularity: actorDetails.popularity ?? 0,
                        )
                      ],
                    )

            )));
  }
}
