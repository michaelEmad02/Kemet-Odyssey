import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:kemet_odyssey/core/services/api_services.dart';
import 'package:kemet_odyssey/core/services/auth_services.dart';
import 'package:kemet_odyssey/core/services/firebase_auth_services.dart';
import 'package:kemet_odyssey/core/services/hive_services.dart';
import 'package:kemet_odyssey/core/services/json_file_services.dart';
import 'package:kemet_odyssey/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:kemet_odyssey/features/auth/data/repositories/auth_repo_implementation.dart';
import 'package:kemet_odyssey/features/auth/domain/repositories/auth_repo.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/signin_with_email_use_case.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/signin_with_google_use_case.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/singup_with_email_use_case.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/verify_email_use_case.dart';
import 'package:kemet_odyssey/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:kemet_odyssey/features/destinations/data/datasources/destination_local_data_source.dart';
import 'package:kemet_odyssey/features/destinations/data/datasources/destination_remote_data_sources.dart';
import 'package:kemet_odyssey/features/destinations/data/repositories/destinations_repo_impl.dart';
import 'package:kemet_odyssey/features/destinations/domain/repositories/destinations_repo.dart';
import 'package:kemet_odyssey/features/destinations/domain/usecases/get_cities_use_case.dart';
import 'package:kemet_odyssey/features/destinations/domain/usecases/get_place_details_use_case.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/fetch_destinations_data_cubit.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/fetch_place_details_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // await HiveServices.init();

  // Services
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<JsonFileServices>(() => JsonFileServices());
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));
  getIt.registerLazySingleton<HiveServices>(() => HiveServices());
  getIt.registerLazySingleton<AuthServices>(
      () => FirebaseAuthServices(firebaseAuth: FirebaseAuth.instance));

  // Data Sources
  getIt.registerLazySingleton<DestinationLocalDataSource>(() =>
      DestinationLocalDataSourceImplement(
          iServices: getIt<JsonFileServices>()));
  getIt.registerLazySingleton<DestinationRemoteDataSources>(() =>
      DestinationRemoteDataSourcesImplement(iServices: getIt<ApiServices>()));

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () =>
        AuthRemoteDataSourceImplementation(authServices: getIt<AuthServices>()),
  );

  // Repositories
  getIt.registerLazySingleton<DestinationsRepo>(() => DestinationsRepoImpl(
      localDataSource: getIt<DestinationLocalDataSource>()));

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImplementation(
        authRemoteDataSource: getIt<AuthRemoteDataSource>()),
  );

  // Use Cases
  getIt.registerLazySingleton<GetCitiesUseCase>(
    () => GetCitiesUseCase(
      destinationsRepo: getIt<DestinationsRepo>(),
    ),
  );
  getIt.registerLazySingleton<GetPlaceDetailsUseCase>(
    () => GetPlaceDetailsUseCase(
      destinationsRepo: getIt<DestinationsRepo>(),
    ),
  );
  // auth use case
  getIt.registerLazySingleton<SigninWithEmailUseCase>(
    () => SigninWithEmailUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SigninWithGoogleUseCase>(
    () => SigninWithGoogleUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SingupWithEmailUseCase>(
    () => SingupWithEmailUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<VerifyEmailUseCase>(
    () => VerifyEmailUseCase(authRepo: getIt<AuthRepo>()),
  );

  // Cubits
  getIt.registerFactory<FetchDestinationsDataCubit>(
    () => FetchDestinationsDataCubit(
      getIt<GetCitiesUseCase>(),
    ),
  );
  getIt.registerFactory<FetchPlaceDetailsCubit>(
    () => FetchPlaceDetailsCubit(
      getIt<GetPlaceDetailsUseCase>(),
    ),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
        getIt<SigninWithEmailUseCase>(),
        getIt<SingupWithEmailUseCase>(),
        getIt<SigninWithGoogleUseCase>(),
        getIt<VerifyEmailUseCase>(),
        getIt<ResetPasswordUseCase>()),
  );
}
