import 'package:flutter/material.dart';
import 'package:movies_database/pages/search_page.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import 'package:provider/provider.dart';

import '../bloc/home_page_bloc.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../view_items/home_page_view_items/actor_list_view_items.dart';
import '../view_items/home_page_view_items/banner_movie_item_view.dart';
import '../view_items/home_page_view_items/genre_movie_list_item_view.dart';
import '../view_items/home_page_view_items/genre_movie_type_item_view.dart';
import '../view_items/home_page_view_items/popular_movies_item_view.dart';
import '../view_items/home_page_view_items/top_rated_movies_item_view.dart';
import '../widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (_) => HomePageBloc(),
      child: Scaffold(
        backgroundColor: kPrimaryBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),

              ///Search Bar Session
              SearchBarWidget(
                onTap: () {
                  context.navigateToNextScreen(context, const SearchPage());
                },
              ),

              ///Genres List Session
              Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: kSP10x, vertical: kSP20x),
                  child: const GenreMovieTypeItemView()),
              const SizedBox(
                height: kSP20x,
              ),

              ///Banner Session
              const SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: BannerMovieItemView()),

              ///Movie by Genres Session
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: kSP20x, vertical: kSP40x),
                height: kMovieByGenresHeight,
                child: const GenreMovieListItemView(),
              ),

              ///Top rated movies or You may like Session
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: kSP20x, vertical: kSP40x),
                height: kYouMayLikeAndPopularMoviesViewHeight,
                child: const YouMayLikeItemView(),
              ),

              ///Popular movies session
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: kSP20x, vertical: kSP40x),
                height: kYouMayLikeAndPopularMoviesViewHeight,
                child: const PopularMoviesItemView(),
              ),

              ///Actor session
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: kSP10x, vertical: kSP40x),
                child: const ActorListItemView(),
              ),
              const SizedBox(
                height: kSP30x,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
