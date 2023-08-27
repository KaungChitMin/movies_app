import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';
import 'package:movies_database/widgets/easy_image_widget.dart';
import 'package:provider/provider.dart';

import '../../bloc/home_page_bloc.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/genre_vo/genre_vo.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/gradient_widget.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/movies_widget.dart';

/// Genre title item view and view
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

/// banner movies item view and view

class BannerMovieItemView extends StatelessWidget {
  const BannerMovieItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
      shouldRebuild: (first, second) => first != second,
      selector: (_, bloc) => bloc.getBannerMovieList,
      builder: (_, bannerList, __) {
        if (bannerList == null && bannerList!.isEmpty) {
          return const EasyText(text: kNoDataText);
        }
        return CarouselSlider.builder(
            itemCount: bannerList.length,
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              aspectRatio: 1,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
            ),
            itemBuilder: (_, index, __) => BannerMovieView(
                  movie: bannerList[index],
                ));
      },
    );
  }
}

class BannerMovieView extends StatelessWidget {
  const BannerMovieView({super.key, required this.movie});

  final MovieVO movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// banner image
        Positioned.fill(
          child: BannerMovieImageView(
            imageUrl: movie.posterPath ?? '',
          ),
        ),

        /// Gradient color
        const GradientWidget(),

        /// play button icon
        const Positioned.fill(
          child: Align(
            child: CircleAvatar(
              radius: 20,
              backgroundColor: kSecondaryBackgroundColor,
              child: Icon(
                Icons.play_arrow_outlined,
                color: kSecondaryTextColor,
                size: 35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BannerMovieImageView extends StatelessWidget {
  const BannerMovieImageView({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kSP20x),
      child: EasyImageWidget(
        image: imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

/// genre movie list item view and view


class GenreMovieListItemView extends StatelessWidget {
  const GenreMovieListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
        shouldRebuild: (first, second) => first != second,
        selector: (_, bloc) => bloc.getGenreMovieList,
        builder: (_, genreMovieList, __) {
          if (genreMovieList == null && genreMovieList!.isEmpty) {
            return const LoadingWidget();
          }
          return GenreMovieListView(
            movieList: genreMovieList,
          );
        });
  }
}


class GenreMovieListView extends StatelessWidget {
  const GenreMovieListView({super.key, required this.movieList});

  final List<MovieVO> movieList;

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, ScrollController>(
        selector: (_, bloc) => bloc.getControllerForGenreMovies,
        builder: (_, controller, __) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              controller: controller,
              itemBuilder: (_, index) {
                return GenreMovieWidget(movieVO: movieList[index]);
              });
        });
  }
}
