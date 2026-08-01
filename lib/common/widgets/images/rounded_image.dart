import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomm/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class URoundedImage extends StatelessWidget {
  const URoundedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.applyImageRadius = true,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onTap,
    this.borderRadius = USizes.md,
    this.border,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onTap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? imageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: fit,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          const UShimmerEffect(width: double.infinity, height: double.infinity),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    )
                  : const Icon(Icons.error)
              : Image(
                  image: AssetImage(imageUrl) as ImageProvider,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
