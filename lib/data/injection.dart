

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/network/api_consumer.dart';

import 'app_urls/app_url.dart';
import 'datasource/local/cache_consumer.dart';
import 'datasource/remote/dio/dio_client.dart';
import 'datasource/remote/dio/logging_interceptor.dart';




final getIt = GetIt.instance;
Future<void> init() async {
  /// Core
  getIt.registerLazySingleton(() => DioClient(AppURL.kBaseURL, getIt(), loggingInterceptor: getIt(), cacheConsumer:  getIt()));


  /// Repository
  // getIt.registerLazySingleton<LocalRepository>(() => LocalRepositoryImp(dioClient: getIt(),cacheConsumer: getIt()));
  // getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(dioClient: getIt()));
  // getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImp(dioClient: getIt()));
  // getIt.registerLazySingleton<SettingRepository>(() => SettingRepositoryImp(dioClient: getIt()));
  // getIt.registerLazySingleton<NotificationRepository>(() => NotificationRepositoryImp(dioClient: getIt()));
  // getIt.registerLazySingleton<OfferRepository>(() => OfferRepositoryImp(dioClient: getIt()));


  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());

  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(() => CacheConsumer(secureStorage: getIt() ,sharedPreferences: getIt()));



  getIt.registerLazySingleton<PrettyDioLogger>(() => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true),);
  getIt.registerLazySingleton(() => ApiConsumer(getIt<Dio>(), getIt<PrettyDioLogger>(), getIt()));


}