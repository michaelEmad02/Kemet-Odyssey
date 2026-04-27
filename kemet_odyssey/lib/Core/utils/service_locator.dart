import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kemet_odyssey/core/services/api_services.dart';
import 'package:kemet_odyssey/core/services/hive_services.dart';
import 'package:kemet_odyssey/core/services/json_file_services.dart';
import 'package:kemet_odyssey/features/destinations/data/datasources/destination_local_data_source.dart';
import 'package:kemet_odyssey/features/destinations/data/datasources/destination_remote_data_sources.dart';
import 'package:kemet_odyssey/features/destinations/data/repositories/destinations_repo_impl.dart';
import 'package:kemet_odyssey/features/destinations/domain/repositories/destinations_repo.dart';
import 'package:kemet_odyssey/features/destinations/domain/usecases/get_cities_use_case.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/fetch_destinations_data_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  await HiveServices.init();
  
  // Services
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<JsonFileServices>(() => JsonFileServices());
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));
  getIt.registerLazySingleton<HiveServices>(() => HiveServices());

  // Data Sources
  getIt.registerLazySingleton<DestinationLocalDataSource>(() =>
      DestinationLocalDataSourceImplement(
          iServices: getIt<JsonFileServices>()));
  getIt.registerLazySingleton<DestinationRemoteDataSources>(() =>
      DestinationRemoteDataSourcesImplement(iServices: getIt<ApiServices>()));

  // Repositories
  getIt.registerLazySingleton<DestinationsRepo>(() => DestinationsRepoImpl(
      localDataSource: getIt<DestinationLocalDataSource>()));

  // Use Cases
  getIt.registerLazySingleton<GetCitiesUseCase>(
      () => GetCitiesUseCase(destinationsRepo: getIt<DestinationsRepo>()));

  // Cubits
  getIt.registerFactory<FetchDestinationsDataCubit>(
      () => FetchDestinationsDataCubit(getIt<GetCitiesUseCase>()));
}
