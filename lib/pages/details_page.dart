import 'package:flutter/material.dart';
import 'package:movies_database/bloc/details_page_bloc.dart';
import 'package:movies_database/constant/colors.dart';
import 'package:movies_database/constant/dimens.dart';
import 'package:movies_database/data/vos/movies_details_vo/movie_details_vo.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import 'package:movies_database/view_items/details_page_view_items/sliver_app_bar_view_item.dart';
import 'package:movies_database/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../view_items/details_page_view_items/movie_type_item_view.dart';

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
            builder: (_, movieDetailsVo, __) => movieDetailsVo == null
                ? const Center(
                    child: LoadingWidget(),
                  )
                : NestedScrollView(
                    headerSliverBuilder: (context, bool one) => [
                          SliverAppBarItemView(
                            movieName: movieDetailsVo.title ?? '',
                            onTapBack: () {context.navigateBack(context);},
                            imageUrl: movieDetailsVo.posterPath ?? '',
                            runTime: movieDetailsVo.getRunTime(),
                          )
                        ],
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          MovieTypeItemView(
                            movieType: movieDetailsVo.getMovieGenresAndRunTime(),
                          ),
                          const SizedBox(
                            height: kSP20x,
                          ),

                          Container(
                            height: 200,
                            color: Colors.amber,
                          )

                        ],
                      ),
                    )),
          ),
        ));
  }
}

