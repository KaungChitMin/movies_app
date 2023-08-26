import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constant/api_constant.dart';
import '../utils/imgae_utils.dart';

class EasyImageWidget extends StatelessWidget {
  const EasyImageWidget(
      {Key? key,
      required this.image,
      this.fit = BoxFit.contain,
      this.height,
      this.width})
      : super(key: key);
  final String image;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: (image.isEmpty) ? kDefaultImage : '$kImagePrefixLink$image',
      placeholder: (_, __) => Image.asset(
        AssetsImagesUtils.backgroundImageUtil,
        fit: fit,
      ),
    );
  }
}
