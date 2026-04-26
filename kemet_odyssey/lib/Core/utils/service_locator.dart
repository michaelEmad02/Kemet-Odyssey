import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kemet_odyssey/core/services/api_services.dart';
import 'package:kemet_odyssey/core/services/hive_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Services
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));
  getIt.registerLazySingleton<HiveServices>(() => HiveServices());
}
