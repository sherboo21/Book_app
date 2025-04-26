import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class AppMessage extends StatelessWidget {
  final String title;

  const AppMessage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: title,
      textAlign: TextAlign.center,
      textSize: 16.sp,
      textWeight: FontWeight.w600,
    );
  }
}
