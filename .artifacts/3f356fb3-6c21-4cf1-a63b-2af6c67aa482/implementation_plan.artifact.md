# Implement Cached Network Image for URoundedImage

The `URoundedImage` widget currently uses standard `NetworkImage`, which does not provide persistent caching or a loading state (shimmer). We will update it to use `CachedNetworkImage` to improve performance and user experience.

## Proposed Changes

### Common Widgets

#### [MODIFY] [rounded_image.dart](file:///D:/ecomm/lib/common/widgets/images/rounded_image.dart)
- Import `package:cached_network_image/cached_network_image.dart`.
- Import `package:ecomm/common/widgets/shimmer/shimmer_effect.dart`.
- Update the `build` method to use `CachedNetworkImage` when `isNetworkImage` is true.
- Add `progressIndicatorBuilder` with `UShimmerEffect`.
- Add `errorWidget` to show an error icon if loading fails.

## Verification Plan

### Manual Verification
- Run the app and navigate to screens using `URoundedImage` with network images (e.g., product cards if they use network images).
- Verify that a shimmer effect is shown while the image is loading.
- Verify that the image is cached and loads faster on subsequent views.
