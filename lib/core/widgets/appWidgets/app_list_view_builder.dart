import 'package:education/core/helpers/extentions.dart';
import 'package:flutter/material.dart';

class AppListViewBuilder extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Axis? scrollDirection;
  final double? hPadding, vPadding;
  final Widget? separatorBuilder;
  final ScrollController? scrollController;

  const AppListViewBuilder(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      this.scrollDirection,
      this.hPadding,
      this.vPadding,
      this.separatorBuilder,
      this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: scrollDirection == null
          ? const NeverScrollableScrollPhysics()
          : const AlwaysScrollableScrollPhysics(),
      itemCount: itemCount,
      controller: scrollController,
      scrollDirection: scrollDirection ?? Axis.vertical,
      padding: EdgeInsets.symmetric(
          horizontal: hPadding ?? 20.W, vertical: vPadding ?? 8.H),
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) =>
          separatorBuilder ??
          (scrollDirection == Axis.vertical ? 20.H.pH : 10.W.pW),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      cacheExtent: 50,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      shrinkWrap: true,
    );
  }
}
