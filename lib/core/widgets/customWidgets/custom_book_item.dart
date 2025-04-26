import 'package:education/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../feature/home/logic/home_cubit.dart';
import '../../helpers/app_strings.dart';
import '../appWidgets/app_button.dart';
import '../appWidgets/app_cashed_image.dart';
import '../appWidgets/app_shimmer.dart';
import '../appWidgets/app_text.dart';
import 'custom_expandable_text.dart';

class CustomBookItem extends StatelessWidget {
  final int index;

  const CustomBookItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final book = context.read<HomeCubit>().booksDataModel.results![index];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        book.formats?.imageJpeg?.isNotEmpty == true
            ? AppCacheImage(imageUrl: book.formats!.imageJpeg!)
            : AppShimmer(
                width: 90.W,
                height: 95.H,
                hPadding: 0.0,
                vPadding: 0.0,
              ),
        8.horizontalSpace,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: book.title?.isNotEmpty == true ? book.title! : '-',
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
              ),
              5.verticalSpace,
              AppText(
                text: book.authors?.isNotEmpty == true
                    ? book.authors!.map((e) => e.name).join(' , ')
                    : '-',
                textSize: 12.sp,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
              ),
              5.verticalSpace,
              CustomExpandableText(
                text: book.summaries?.isNotEmpty == true
                    ? book.summaries![0]
                    : '-',
                trimLines: 3,
              ),
              10.verticalSpace,
              AppButton(
                title: AppStrings.read,
                height: 40.H,
              ),
            ],
          ),
        )
      ],
    );
  }
}
