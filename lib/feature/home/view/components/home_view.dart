import 'package:education/core/helpers/app_strings.dart';
import 'package:education/core/theme/app_colors.dart';
import 'package:education/core/widgets/appWidgets/app_scaffold.dart';
import 'package:education/core/widgets/customWidgets/custom_body.dart';
import 'package:education/feature/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_item.dart';
import 'home_listener.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeListener(
      homeBuilder: (context, state) {
        return AppScaffold(
          title: AppStrings.bookApp,
          body: CustomBody(
            child: RefreshIndicator(
              onRefresh: () => context.read<HomeCubit>().onInit(),
              color: AppColors.mainAppColor,
              child: const HomeItem(),
            ),
          ),
        );
      },
    );
  }
}
