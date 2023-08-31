import 'package:flutter/material.dart';
import 'package:movies_database/constant/strings.dart';
import 'package:movies_database/data/vos/movies_details_vo/production_companies_vo.dart';
import 'package:movies_database/widgets/easy_image_widget.dart';
import 'package:movies_database/widgets/easy_text_widget.dart';

import '../../constant/dimens.dart';

class ProductionCompaniesView extends StatelessWidget {
  const ProductionCompaniesView({super.key, required this.productionCompanies});

  final List<ProductionCompaniesVO> productionCompanies;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kSP10x),
          child: EasyText(
            text: kProductionCompaniesText,
            fontSize: kFontSie23x,
            fontWeight: FontWeight.w600,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: productionCompanies
                  .map((e) => ProductionCompaniesImageAndNameView(
                      name: e.name ?? '', imageUrl: e.logoPath ?? ''))
                  .toList()),
        ),
      ],
    );
  }
}

class ProductionCompaniesImageAndNameView extends StatelessWidget {
  const ProductionCompaniesImageAndNameView(
      {super.key, required this.imageUrl, required this.name});

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP20x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: kProductionCompaniesImageHeight,
            child: EasyImageWidget(image: imageUrl),
          ),
          EasyText(text: name)
        ],
      ),
    );
  }
}
