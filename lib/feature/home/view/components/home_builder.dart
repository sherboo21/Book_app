import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/appWidgets/app_list_view_builder.dart';
import '../../../../core/widgets/customWidgets/custom_book_item.dart';
import '../../logic/home_cubit.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListViewBuilder(
      scrollDirection: Axis.vertical,
      itemCount: context.read<HomeCubit>().booksDataModel.results!.length,
      hPadding: 0.0,
      itemBuilder: (context, index) => CustomBookItem(
        index: index,
      ),
    );
  }
}
