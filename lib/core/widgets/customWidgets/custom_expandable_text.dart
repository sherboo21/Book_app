import 'package:education/core/helpers/app_strings.dart';
import 'package:education/core/helpers/extentions.dart';
import 'package:education/core/widgets/appWidgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class CustomExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;

  const CustomExpandableText({
    super.key,
    required this.text,
    required this.trimLines,
  });

  @override
  State<CustomExpandableText> createState() => _CustomExpandableTextState();
}

class _CustomExpandableTextState extends State<CustomExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final span = TextSpan(text: widget.text);
    final tp = TextPainter(
      text: span,
      maxLines: widget.trimLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    final isOverflowing = tp.didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: widget.text,
          maxLines: isExpanded ? null : widget.trimLines,
          textOverflow:
              isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          textSize: 10.sp,
          textColor: AppColors.summaryTextColor,
        ),
        if (isOverflowing)
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AppText(
                text: isExpanded ? AppStrings.showLess : AppStrings.showMore,
                textColor: AppColors.mainAppColor,
                textSize: 12.sp,
              ).addOnlyPadding(tVal: 5.H),
            ),
          ),
      ],
    );
  }
}
