import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/main_functions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';

class HomeListener extends StatelessWidget {
  final Widget Function(BuildContext, HomeState) homeBuilder;

  const HomeListener({
    super.key,
    required this.homeBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.booksState.isError) {
          customSnackBar(
              context: context,
              message: AppStrings.anErrorOccurred,
              color: AppColors.errorColor);
        }
      },
      builder: homeBuilder,
    );
  }
}
