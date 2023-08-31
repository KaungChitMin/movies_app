import 'package:flutter/material.dart';
import 'package:movies_database/bloc/details_page_bloc.dart';
import 'package:movies_database/constant/colors.dart';
import 'package:movies_database/constant/dimens.dart';
import 'package:movies_database/data/vos/movies_details_vo/movie_details_vo.dart';
import 'package:movies_database/pages/recommended_movie_view.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import 'package:movies_database/view_items/details_page_view_items/sliver_app_bar_view_item.dart';
import 'package:movies_database/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../view_items/details_page_view_items/cast_list_item_view.dart';
import '../view_items/details_page_view_items/movie_type_item_view.dart';
import '../view_items/details_page_view_items/production_company_item_view.dart';
import '../view_items/details_page_view_items/story_line_item_view.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.movieID});

  final int movieID;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DetailsPageBLoc(movieID),
        child: Scaffold(
          backgroundColor: kPrimaryBackgroundColor,
          body: Selector<DetailsPageBLoc, MovieDetailsVO?>(
            selector: (_, b) => b.getMovieDetailsVO,
            builder: (_, detailVo, __) => detailVo == null
                ? const Center(
                    child: LoadingWidget(),
                  )
                : NestedScrollView(
                    headerSliverBuilder: (context, bool one) => [
                          SliverAppBarItemView(
                            movieName: detailVo.title ?? '',
                            onTapBack: () {
                              context.navigateBack(context);
                            },
                            imageUrl: detailVo.posterPath ?? '',
                            runTime: detailVo.getRunTime(),
                          )
                        ],
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Genre Movie Type
                          MovieTypeView(
                            movieType: detailVo.getMovieGenresAndRunTime(),
                          ),

                          ///Movie over view or Story Lines view
                          StoryLineView(
                            overview: detailVo.overview ?? '',
                          ),
                          const SizedBox(
                            height: kSP50x,
                          ),

                          ///Cast List or Star Cast Session
                          const CastListView(),
                          const SizedBox(
                            height: kSP50x,
                          ),

                          ///Crew List or Star Cast Session
                          const CrewListVIew(),
                          const SizedBox(
                            height: kSP20x,
                          ),

                          ///Production Company Session
                          ProductionCompaniesView(
                            productionCompanies:
                                detailVo.productionCompanies ?? [],
                          ),
                          const SizedBox(
                            height: kSP30x,
                          ),

                          ///Recommended movies Session
                           Container(
                             margin: const EdgeInsets.symmetric(horizontal: kSP10x),
                               child: const RecommendedMoviesView()
                           ),
                           const SizedBox(
                            height: kSP50x,
                          )
                        ],
                      ),
                    )),
          ),
        ));
  }
}
