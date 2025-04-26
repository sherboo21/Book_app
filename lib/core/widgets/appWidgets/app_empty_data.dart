import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import 'app_text.dart';

class AppEmptyData extends StatelessWidget {
  final String title;

  const AppEmptyData({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AppText(
      text: title,
      textSize: 20.sp,
      textColor: AppColors.errorColor,
      textAlign: TextAlign.center,
    ));
  }
}
