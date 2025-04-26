import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../di/dependency_injection.dart';
import '../helpers/cubit/app_cubit.dart';
import '../helpers/cubit/internet_connection/internet_cubit.dart';
import '../helpers/cubit/internet_connection/internet_state.dart';
import '../helpers/extentions.dart';
import '../routing/named_router.dart';
import '../routing/named_router_impl.dart';
import '../theme/app_theme.dart';
import '../widgets/appWidgets/app_internet_checker.dart';

class BookApp extends StatelessWidget {
  final AppRouter appRouter;

  const BookApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<InternetConnectionCubit>(),
        ),
      ],
      child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            builder: (context, child) {
              if (state is InternetNotConnectedState) {
                return const AppInternetChecker();
              }
              return GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: MaterialApp(
                  themeAnimationDuration: const Duration(milliseconds: 700),
                  themeAnimationCurve: Curves.easeInOutCubic,
                  initialRoute: Routes.homeRoute,
                  onGenerateRoute: appRouter.generateRoute,
                  navigatorKey: nK,
                  debugShowCheckedModeBanner: false,
                  locale: const Locale('en'),
                  title: 'Book app',
                  theme: AppTheme.lightThemeData,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
