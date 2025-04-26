import 'package:education/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../widgets/appWidgets/app_message.dart';
import '../widgets/appWidgets/app_text.dart';

/// show snack bar ///
customSnackBar(
    {required BuildContext context,
    required String message,
    required Color color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 3),
        content: AppText(
          text: message,
          textColor: Colors.white,
          textWeight: FontWeight.w600,
        )),
  );
}

/// Show Alert Dialog ///
customAlertDialog(
    {required Widget content,
    bool? barrierDismissible,
    type,
    double? hMargin,
    radius,
    duration,
    hPadding,
    vPadding,
    width,
    Function()? function}) {
  showAdaptiveDialog(
      context: GlobalContextExt.globalContext!,
      barrierDismissible: barrierDismissible ?? true,
      builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
                elevation: 2,
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius ?? 15.r),
                      color: Colors.white),
                  padding: EdgeInsets.symmetric(
                      horizontal: hPadding ?? 0.0, vertical: vPadding ?? 0.0),
                  child: content,
                ),
              ).addSymmetricPadding(hVal: hMargin ?? 20.W),
            ],
          )).then((value) {
    if (function != null) {
      Future.microtask(() => function()); // Ensures async execution
    }
  });
  type == null
      ? null
      : Future.delayed(Duration(milliseconds: duration ?? 2000),
          () => GlobalContextExt.globalContext!.pop());
}

/// app warning message ///
appWarningAlertDialogMessage({required String title, Function()? function}) {
  return customAlertDialog(
      duration: 2000,
      width: 300.w,
      hMargin: 40.W,
      vPadding: 25.H,
      type: true,
      barrierDismissible: false,
      content: AppMessage(title: title),
      function: function != null ? function() : null);
}

/// Show BottomSheet ///
customBottomSheet({
  required Widget content,
  required ScrollController scrollController,
  double? paddingHorizontal,
  double? paddingVertical,
  bool? isDismissible,
}) {
  return showModalBottomSheet(
    isDismissible: isDismissible ?? true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(30.r),
    )),
    backgroundColor: Colors.white,
    context: GlobalContextExt.globalContext!,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: -10.H,
                child: SizedBox(
                  width: 60.W,
                  child: Container(
                    height: 7.h,
                    width: 60.W,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.mainAppColor),
                  ),
                )),
            content.addSymmetricPadding(
                hVal: paddingHorizontal ?? 20.W, vVal: paddingVertical ?? 15.H),
          ],
        ),
      ),
    ),
  );
}
