import 'package:flutter/material.dart';
import 'package:movies_database/pages/search_page.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import 'package:movies_database/view_items/home_page_view_items/gernre_list_view_item.dart';
import 'package:provider/provider.dart';
import '../bloc/home_page_bloc.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
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
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),

              /// Search Bar Session
              SearchBarWidget(
                onTap: () {
                  context.navigateToNextScreen(context, const SearchPage());
                },
              ),

              ///Genres List Session
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: kSP10x,vertical: kSP20x),
                  child: const GenreMovieTypeItemView()),
              const SizedBox(
                height: kSP20x,
              ),

              ///Banner Session
             const SizedBox(
                 height: 250,
                 width: double.infinity,
                 child:  BannerMovieItemView()),
               const SizedBox(
                 height: kSP30x,
               ),

               ///Movie by Genres Session
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: kSP10x, vertical: kSP10x),
                height: kMovieByGenresHeight,
                child: const MovieByGenreItemView(),
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
