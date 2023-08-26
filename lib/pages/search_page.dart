import 'package:flutter/material.dart';
import 'package:movies_database/data/vos/movie_vo/movie_vo.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import 'package:provider/provider.dart';
import '../bloc/search_page_bloc.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../view_items/back_button/back_button_view_item.dart';
import '../view_items/search_movies/search_movie_view_item.dart';
import '../widgets/search_bar_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchPageBloc>(
      create: (_) => SearchPageBloc(),
      child: Scaffold(
        backgroundColor: kPrimaryBackgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),

            /// Back Button
            const BackButtonItemView(),
            const SizedBox(height: kSP20x),

            /// Search bar
            const SearchBarItemView(),
            const SizedBox(
              height: kSP5x
            ),

            /// Search bar movies
            const SearchMovieListItemView()
          ],
        ),
      ),
    );
  }
}



/// Search bar
class SearchBarItemView extends StatelessWidget {
  const SearchBarItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, List<MovieVO>?>(
      selector: (_, bloc) => bloc.getSearchMoviesList,
      builder: (_, moviesList, __) => SearchBarWidget(
        isAutoFocus: true,
        isEnable: true,
        onChange: (text) {
          context.getSearchPageBlocInstance().searchText(text);
        },
        onTap: () {},
      ),
    );
  }
}
