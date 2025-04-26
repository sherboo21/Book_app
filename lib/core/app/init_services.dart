import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../di/dependency_injection.dart';
import '../helpers/bloc_observer.dart';
import '../widgets/appWidgets/app_error_widget.dart';

Future<void> initServices() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(AppErrorWidgetClass(errorDetails: details));
  };
  await Future.wait<void>([ScreenUtil.ensureScreenSize(), setupGetIt()]);
  Bloc.observer = MyBlocObserver();
}
