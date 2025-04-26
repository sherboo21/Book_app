import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final Color? background, borderColor, textColor;
  final Function()? onTap;
  final double? elevation, fontSize, height, width, radius;
  final String? title;
  final FontWeight? fontWeight;
  final BorderRadius? borderOnly;

  const AppButton({
    super.key,
    this.onTap,
    this.child,
    this.fontWeight,
    this.textColor,
    this.width,
    this.height,
    this.background,
    this.borderColor,
    this.radius,
    this.elevation,
    this.fontSize,
    this.title,
    this.borderOnly,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 0.0,
        minimumSize: Size(width ?? double.infinity, height ?? double.infinity),
        backgroundColor: background ?? AppColors.mainAppColor,
        disabledBackgroundColor: background ?? AppColors.mainAppColor,
        side: BorderSide(color: borderColor ?? Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: borderOnly ?? BorderRadius.circular(radius ?? 8.r),
        ),
      ),
      onPressed: onTap,
      child: child ??
          AppText(
            text: title ?? '',
            textAlign: TextAlign.center,
            textSize: fontSize,
            textColor: textColor ?? AppColors.scaffoldColor,
            textWeight: fontWeight ?? FontWeight.w600,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
    );
  }
}
