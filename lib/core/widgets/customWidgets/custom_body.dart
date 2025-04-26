import 'package:education/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class CustomBody extends StatelessWidget {
  final Widget child;
  final double? hPadding;

  const CustomBody({super.key, required this.child, this.hPadding});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        margin: EdgeInsets.only(top: 7.H),
        padding: EdgeInsets.symmetric(
          horizontal: hPadding ?? 20.W,
          vertical: 15.H,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r),
              topRight: Radius.circular(50.r),
            ),
            color: AppColors.scaffoldColor),
        child: child,
      ),
    );
  }
}
