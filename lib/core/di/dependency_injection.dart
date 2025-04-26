import 'package:dio/dio.dart';
import 'package:education/feature/home/data/apis/home_api_services.dart';
import 'package:education/feature/home/data/model/books.dart';
import 'package:education/feature/home/data/repo/home_repo.dart';
import 'package:education/feature/home/logic/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/cubit/app_cubit.dart';
import '../helpers/cubit/internet_connection/internet_cubit.dart';
import '../networking/network/app_constants.dart';
import '../networking/network/base_consumer.dart';
import '../networking/network/dio_consumer.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  /// Register DioConsumer to handle API calls using Dio ///
  final logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 100,
  );
  final dio = Dio(BaseOptions(
    baseUrl: AppApiConstants.baseUrl,
    receiveDataWhenStatusError: true,
  ));
  dio.interceptors.add(logger);

  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<BaseConsumer>(() => DioConsumer(getIt<Dio>()));

  /// FOR APP CUBIT ///
  getIt.registerFactory<AppCubit>(() => AppCubit());

  /// FOR INTERNET CHECKER CUBIT ///
  getIt.registerFactory<InternetConnectionCubit>(
      () => InternetConnectionCubit());

  // /// FOR HOME ///
  getIt.registerLazySingleton<HomeRepository>(() => HomeServices());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepository>()));
  getIt.registerLazySingleton<BooksDataModel>(() => BooksDataModel());
}
