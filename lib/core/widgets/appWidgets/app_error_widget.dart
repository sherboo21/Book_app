import 'package:education/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_scaffold.dart';
import 'app_text.dart';

class AppErrorWidgetClass extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const AppErrorWidgetClass({super.key, required this.errorDetails});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Error Widget',
      home: AppScaffold(
          body: Center(
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.W, vertical: 20.H),
            child: AppText(
              text: " ' ${errorDetails.exceptionAsString()}' ",
              textAlign: TextAlign.center,
              textSize: 24.sp,
              textWeight: FontWeight.w700,
            )),
      )),
    );
  }
}
