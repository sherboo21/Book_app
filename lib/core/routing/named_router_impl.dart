import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/logic/home_cubit.dart';
import '../../feature/home/view/components/home_view.dart';
import '../di/dependency_injection.dart';
import 'named_router.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<HomeCubit>(),
                child: const HomeView()));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
