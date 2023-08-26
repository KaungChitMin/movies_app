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
// class BannerMovieItemView extends StatelessWidget {
//   const BannerMovieItemView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Selector<HomePageBloc, List<MovieVO>?>(
//         shouldRebuild: (pre, next) => pre != next,
//         selector: (_, bloc) => bloc.getBannerMovieList,
//         builder: (_, movieList, __) {
//           if (movieList == null) {
//             return const SizedBox(
//                 height: kDefaultSize,
//                 child: Center(child: EasyText(text: kNoDataText)));
//           }
//           if (movieList.isEmpty) {
//             return const SizedBox(height: kDefaultSize, child: LoadingWidget());
//           }
//           return CarouselSlider.builder(
//               options: CarouselOptions(
//                 aspectRatio: 1,
//                 autoPlay: true,
//                 enableInfiniteScroll: false,
//                 enlargeCenterPage: true,
//                 scrollDirection: Axis.horizontal,
//               ),
//               itemCount: movieList.length,
//               itemBuilder:
//                   (BuildContext context, int itemIndex, int pageViewIndex) =>
//                       BannerMovieView(
//                         movieVO: movieList[itemIndex],
//                       ));
//         });
//   }
// }

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

        return ListView.separated(
          separatorBuilder: (_, index) => const SizedBox(
            width: kSP20x,
          ),
          itemCount: bannerList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => BannerMovieView(
            movie: bannerList[index],
          ),
        );
      },
    );
  }
}

// class BannerMovieView extends StatelessWidget {
//   const BannerMovieView({super.key, required this.movieVO});
//
//   final MovieVO movieVO;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned.fill(
//             child: BannerAndMovieGenresImageWidget(
//           imageURL: movieVO.posterPath ?? '',
//         )),
//         const GradientWidget(),
//         Align(
//             alignment: Alignment.center,
//             child: GestureDetector(
//               child: Container(
//                 width: kPlayButtonSize,
//                 height: kPlayButtonSize,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(kSP30x),
//                   color: kSecondaryBackgroundColor,
//                 ),
//                 child: const Icon(
//                   Icons.play_arrow_outlined,
//                   color: kSecondaryTextColor,
//                 ),
//               ),
//             ))
//       ],
//     );
//   }
// }

class BannerMovieView extends StatelessWidget {
  const BannerMovieView({super.key, required this.movie});

  final MovieVO movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: kSP20x),
      child: Stack(
        children: [
          /// banner image
          BannerMovieImageView(
            imageUrl: movie.posterPath ?? '',
          ),

          /// Gradient color
          const GradientWidget(),

          /// play button icon
          const Positioned.fill(
            child: Align(
              child:  CircleAvatar(
                radius: 20,
                backgroundColor: kSecondaryBackgroundColor,
                child:  Icon(
                  Icons.play_arrow_outlined,
                  color: kSecondaryTextColor,
                  size: 35,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class BannerAndMovieGenresImageWidget extends StatelessWidget {
//   const BannerAndMovieGenresImageWidget({super.key, required this.imageURL});
//
//   final String imageURL;
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(kSP20x),
//       child: EasyImageWidget(
//         image: imageURL,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

class BannerMovieImageView extends StatelessWidget {
  const BannerMovieImageView({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kSP20x),
      child: EasyImageWidget(
        width: 250,
        image: imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MovieByGenreItemView extends StatelessWidget {
  const MovieByGenreItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
        shouldRebuild: (pre, next) => pre != next,
        selector: (_, bloc) => bloc.getGenreMovieList,
        builder: (_, movieList, __) {
          if (movieList == null) {
            return const Center(child: EasyText(text: kNoDataText));
          }
          if (movieList.isEmpty) {
            return const LoadingWidget();
          }
          return HorizontalMovieByGenreListView(movieList: movieList);
        });
  }
}

class HorizontalMovieByGenreListView extends StatelessWidget {
  const HorizontalMovieByGenreListView({Key? key, required this.movieList})
      : super(key: key);
  final List<MovieVO> movieList;

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, ScrollController>(
      selector: (_, bloc) => bloc.getControllerForGenreMovies,
      builder: (_, controller, __) => ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: movieList.length,
        itemBuilder: (_, index) => MovieWidget(
          movieVO: movieList[index],
        ),
      ),
    );
  }
}
