import 'package:education/core/helpers/extentions.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/appWidgets/app_list_view_builder.dart';
import '../../../../core/widgets/appWidgets/app_shimmer.dart';

class HomeFallBack extends StatelessWidget {
  const HomeFallBack({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListViewBuilder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        hPadding: 0.0,
        separatorBuilder: 8.H.pH,
        itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppShimmer(
                  width: 90.W,
                  height: 95.H,
                  hPadding: 0.0,
                  vPadding: 0.0,
                ),
                const Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppShimmer(
                        padding: 12,
                      ),
                      AppShimmer(
                        padding: 5,
                      ),
                      AppShimmer(
                        padding: 30,
                      ),
                    ],
                  ),
                )
              ],
            ));
  }
}
