import 'package:education/feature/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_strings.dart';
import '../../../../core/widgets/appWidgets/app_conditional_builder.dart';
import '../../../../core/widgets/appWidgets/app_empty_data.dart';
import '../../logic/home_cubit.dart';
import 'home_builder.dart';
import 'home_fall_back.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AppConditionalBuilder(
      condition: !context.watch<HomeCubit>().state.booksState.isLoading,
      builder: (context) => context.watch<HomeCubit>().state.booksState.isError
          ? const AppEmptyData(
              title: AppStrings.noBooksAvailable,
            )
          : context.read<HomeCubit>().booksDataModel.results?.isNotEmpty == true
              ? const HomeBuilder()
              : const AppEmptyData(
                  title: AppStrings.noBooksAvailable,
                ),
      fallBack: (context) => const HomeFallBack(),
    );
  }
}
