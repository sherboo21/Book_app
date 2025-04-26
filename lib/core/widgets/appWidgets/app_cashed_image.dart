import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/main_functions.dart';
import '../../theme/app_colors.dart';
import 'app_shimmer.dart';
import 'app_show_photo.dart';

class AppCacheImage extends StatelessWidget {
  final String imageUrl;
  final Widget Function(BuildContext context, ImageProvider imageProvider)?
      function;

  const AppCacheImage({
    super.key,
    required this.imageUrl,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fadeInDuration: const Duration(milliseconds: 500),
        placeholder: (context, url) => AppShimmer(
              width: 90.W,
              height: 95.H,
              hPadding: 0.0,
              vPadding: 0.0,
            ),
        errorWidget: (context, url, error) => SizedBox(
              width: 90.W,
              height: 95.H,
              child: Center(
                  child: Icon(
                Icons.error,
                color: AppColors.errorColor,
                size: 60.r,
              )),
            ),
        imageBuilder: function ??
            (context, imageProvider) => InkWell(
                  onTap: () => customAlertDialog(
                    content: AppShowPhoto(
                      file: Image(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.fill,
                      width: 90.W,
                      height: 95.H,
                    ),
                  ),
                ));
  }
}
