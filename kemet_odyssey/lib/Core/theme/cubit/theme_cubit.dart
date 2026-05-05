import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// App-wide theme mode. Use [BlocProvider] above [MaterialApp] and read with
/// `context.read<ThemeCubit>()` from any route.
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit([super.initial = ThemeMode.system]);

  void setLight() => emit(ThemeMode.light);

  void setDark() => emit(ThemeMode.dark);

  void setSystem() => emit(ThemeMode.system);

  void setThemeMode(ThemeMode mode) => emit(mode);

  /// Cycles system → light → dark → system.
  void cycleTheme() {
    switch (state) {
      case ThemeMode.system:
        emit(ThemeMode.light);
      case ThemeMode.light:
        emit(ThemeMode.dark);
      case ThemeMode.dark:
        emit(ThemeMode.system);
    }
  }

  /// Toggles only between light and dark (skips system).
  void toggleLightDark() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
