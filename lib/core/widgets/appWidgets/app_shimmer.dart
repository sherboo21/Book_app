import 'package:education/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double? radius, height, width, hPadding, vPadding, padding;

  const AppShimmer(
      {super.key,
      this.radius,
      this.height,
      this.width,
      this.hPadding,
      this.vPadding,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[50]!,
        child: Container(
          width: width,
          height: height,
          margin: EdgeInsets.symmetric(
              horizontal: hPadding ?? 20.W, vertical: vPadding ?? 5.H),
          padding: EdgeInsets.all(padding ?? 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 8.r),
            color: Colors.grey[50]!,
          ),
        ));
  }
}
