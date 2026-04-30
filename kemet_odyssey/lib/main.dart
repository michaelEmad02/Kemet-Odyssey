import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/fetch_destinations_data_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'package:kemet_odyssey/core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: const KemetOdysseyApp(),
    ),
  );
}

class KemetOdysseyApp extends StatelessWidget {
  const KemetOdysseyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, themeMode) {
        return BlocProvider(
          create: (context) =>  getIt<FetchDestinationsDataCubit>()..fetchCitiesData(),
          child: MaterialApp.router(
            title: 'Kemet Odyssey',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
