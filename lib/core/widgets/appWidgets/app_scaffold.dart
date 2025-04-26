import 'package:education/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Color? color;
  final String? title;

  const AppScaffold(
      {super.key,
      required this.body,
      this.scaffoldKey,
      this.color,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppText(
          text: title!,
          textColor: AppColors.scaffoldColor,
          textSize: 20.sp,
        ),
      ),
      backgroundColor: color,
      key: scaffoldKey,
      body: SafeArea(top: false, bottom: false, child: body!),
    );
  }
}
