import 'package:flutter/material.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import 'package:provider/provider.dart';

import '../../bloc/home_page_bloc.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../data/vos/genre_vo/genre_vo.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/loading_widget.dart';

class GenreMovieTypeItemView extends StatelessWidget {
  const GenreMovieTypeItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<GenreVO>?>(
      shouldRebuild: (first, second) => first != second,
      selector: (_, bloc) => bloc.getGenreMovieType,
      builder: (_, genreList, __) {
        if (genreList == null && genreList!.isEmpty) {
          return const LoadingWidget();
        }
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: genreList
                  .map((e) => GestureDetector(
                onTap: () {
                  context
                      .getHomePageBlocInstance()
                      .genreTitleSelect(e.id ?? 0);
                },
                child: SelectGenreTypeView(
                  isSelect: e.isSelect,
                  genreName: e.name ?? '',
                ),
              ))
                  .toList(),
            ));
      },
    );
  }
}

class SelectGenreTypeView extends StatelessWidget {
  const SelectGenreTypeView(
      {super.key, required this.isSelect, required this.genreName});

  final bool isSelect;
  final String genreName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: kSP10x),
      padding: const EdgeInsets.all(kSP10x),
      decoration: (isSelect)
          ? BoxDecoration(
          color: kSecondaryBackgroundColor,
          borderRadius: BorderRadius.circular(kSP5x))
          : null,
      child: EasyText(
        text: genreName,
      ),
    );
  }
}
