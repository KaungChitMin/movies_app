import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/home_page_bloc.dart';
import '../../constant/colors.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../../widgets/easy_image_widget.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/gradient_widget.dart';

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
        Positioned.fill(
          child: BannerMovieImageView(
            imageUrl: movie.backdropPath ?? '',
          ),
        ),

        const GradientWidget(),

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