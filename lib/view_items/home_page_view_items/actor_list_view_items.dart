import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_database/constant/strings.dart';
import 'package:movies_database/pages/actor_details_page.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import 'package:movies_database/widgets/easy_image_widget.dart';
import 'package:movies_database/widgets/easy_text_widget.dart';
import 'package:movies_database/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
import '../../bloc/home_page_bloc.dart';
import '../../constant/dimens.dart';
import '../../data/vos/actor_vo/actor_vo.dart';
import '../../widgets/gradient_widget.dart';

class ActorListItemView extends StatelessWidget {
  const ActorListItemView({super.key,});


  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<ActorVO>?>(
      selector: (_, bloc) => bloc.getActorList,
      builder: (_, actorList, __) {
        if (actorList == null) {
          return const Center(child: LoadingWidget());
        }
        if (actorList.isEmpty) {
          return const Center(
            child: EasyText(text: kNoDataText),
          );
        }
        return CarouselSlider.builder(
          itemCount: actorList.length,
          options: CarouselOptions(
            onPageChanged: (int index,_){
              context.getHomePageBlocInstance().checkIndexForActor(index);
            },
            aspectRatio: 1.1,
            autoPlay: true,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, index, __) {
            return GestureDetector(
              onTap: (){
                context.navigateToNextScreen(context, ActorDetailsPage(actorID: actorList[index].id ?? 0));
              },
              child: ActorImageAndNameView(
                actorVo: actorList[index],
              ),
            );
          },
        );
      },
    );
  }
}

class ActorImageAndNameView extends StatelessWidget {
  const ActorImageAndNameView({super.key, required this.actorVo});

  final ActorVO actorVo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kSP20x),
            child: EasyImageWidget(
              image: actorVo.profilePath ?? '',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const GradientWidget(),
        Align(
          alignment: Alignment.bottomCenter,
          child: EasyText(
            text: actorVo.name ?? '',
            fontSize: kFontSie21x,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
