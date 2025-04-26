import 'package:education/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../helpers/app_imgs.dart';
import '../../helpers/app_strings.dart';
import '../../helpers/cubit/internet_connection/internet_cubit.dart';
import '../../theme/app_colors.dart';
import 'app_button.dart';
import 'app_text.dart';

class AppInternetChecker extends StatelessWidget {
  const AppInternetChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          color: AppColors.scaffoldColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                AppAnimations.noInternetConnectionAnimation,
                height: 200.h,
                width: 200.w,
                fit: BoxFit.contain,
              ),
              20.H.pH,
              AppText(
                text: AppStrings.noInternetConnection,
                textColor: AppColors.errorColor,
                textAlign: TextAlign.center,
                textSize: 24.sp,
              ),
              20.H.pH,
              AppButton(
                height: 45.H,
                title: AppStrings.tryAgain,
                onTap: () =>
                    context.read<InternetConnectionCubit>().retryConnection(),
              ).addSymmetricPadding(hVal: 20.W),
            ],
          )),
    );
  }
}
