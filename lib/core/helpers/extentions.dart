import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_imgs.dart';

/// App Padding ///

EdgeInsetsGeometry appPadding = EdgeInsets.symmetric(
  horizontal: 20.W,
  vertical: 15.H,
);
EdgeInsetsGeometry appContainerPadding = const EdgeInsets.all(5);

extension CustomPadding on Widget {
  /// padding all ///
  addAllPadding(double val) => Padding(
        padding: EdgeInsets.all(val),
        child: this,
      );

  /// padding symmetric ///
  addSymmetricPadding({double? hVal, double? vVal}) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: hVal ?? 0, vertical: vVal ?? 0),
        child: this,
      );

  /// padding only ///
  addOnlyPadding({double? tVal, double? bVal, double? lVal, double? rVal}) =>
      Padding(
        padding: EdgeInsets.only(
            top: tVal ?? 0,
            bottom: bVal ?? 0,
            left: lVal ?? 0,
            right: rVal ?? 0),
        child: this,
      );
}

/// App SizedBox Extension ///

extension EmptyPadding on num {
  SizedBox get pH => SizedBox(height: toDouble());

  SizedBox get pW => SizedBox(width: toDouble());
}

/// APP SIZE EXTENSION ///
extension SizeExtension on num {
  double get W => ScreenUtil().setWidth(this);

  double get H => ScreenUtil().setHeight(this);
}

/// app navigate Extension ///
extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

/// context extension ///
final GlobalKey<NavigatorState> nK = GlobalKey<NavigatorState>();

extension GlobalContextExt on BuildContext {
  static BuildContext? get globalContext => nK.currentContext;
}

/// platform extension ///
extension PlatformCheck on BuildContext {
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;

  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
}

/// Extension to provide direct access to asset path methods ///
extension AssetPathExtension on String {
  String get jsonFile => AssetPaths.jsonFile(this);
}
