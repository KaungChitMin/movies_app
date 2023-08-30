import 'package:flutter/material.dart';
import 'package:movies_database/bloc/details_page_bloc.dart';
import 'package:movies_database/data/vos/movies_details_vo/movie_details_vo.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import 'package:movies_database/view_items/details_page_view_items/sliver_app_bar_view_item.dart';
import 'package:movies_database/widgets/easy_image_widget.dart';
import 'package:movies_database/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.movieID});

  final int movieID;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailsPageBLoc(movieID),
      child: Scaffold(
        body: Selector<DetailsPageBLoc, MovieDetailsVO?>(
          selector: (_, b) => b.getMovieDetailsVO,
          builder: (_, movieDetailsVo, __)=>
          movieDetailsVo == null
            ? const Center(child: LoadingWidget(),)
              : NestedScrollView(
              headerSliverBuilder: (context,bool one)=>[
                SliverAppBarItemView(
                    movieName: movieDetailsVo.title ?? '',
                    onTapBack: (){context.navigateBack(context);},
                    imageUrl: movieDetailsVo.posterPath ?? '',

                )
              ],
              body: SingleChildScrollView(
                child: Column(
                  children: [

              Wrap(
                      direction: Axis.horizontal,
                      children: [
                      ]

                    )
                  ],
                ),
              )
        ),
      ),
      )
    );
  }
}

