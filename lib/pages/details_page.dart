import 'package:flutter/material.dart';
import 'package:movies_database/bloc/details_page_bloc.dart';
import 'package:movies_database/constant/colors.dart';
import 'package:movies_database/constant/strings.dart';
import 'package:movies_database/data/vos/movies_details_vo/movie_details_vo.dart';
import 'package:movies_database/widgets/easy_text_widget.dart';
import 'package:provider/provider.dart';

import '../view_items/details_page_view_items/details_page_view_items.dart';

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
              selector: (_, bloc) => bloc.getMovieDetailsVO,
              builder: (_, movieDetailsVo, __) => (movieDetailsVo == null)
                  ? const Center(child:  EasyText(text: kNoDataText))
                  : NestedScrollView(
                      headerSliverBuilder: (_, bool innerBoxIsScroll) => [
                            SilverAppBarItemView(
                                movieName: movieDetailsVo.title ?? '',
                            imageUrl: movieDetailsVo.posterPath ?? '',
                            )
                          ],
                      body: const EasyText(
                        text: '',
                      ))),
        ));
  }
}
