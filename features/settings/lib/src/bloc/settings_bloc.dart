import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SetThemeUseCase _setThemeUseCase;
  final CheckThemeUseCase _checkThemeUseCase;
  final SetFontSizeUseCase _setFontSizeUseCase;
  final CheckFontSizeUseCase _checkFontSizeUseCase;

  SettingsBloc({
    required SetThemeUseCase setThemeUseCase,
    required CheckThemeUseCase checkThemeUseCase,
    required SetFontSizeUseCase setFontSizeUseCase,
    required CheckFontSizeUseCase checkFontSizeUseCase,
  })  : _setThemeUseCase = setThemeUseCase,
        _checkThemeUseCase = checkThemeUseCase,
        _setFontSizeUseCase = setFontSizeUseCase,
        _checkFontSizeUseCase = checkFontSizeUseCase,
        super(SettingsState(
          isDark: false,
          themeData: AppTheme.lightTheme,
          textScale: 1.0,
        )) {
    on<ChangeThemeEvent>(_onChangeThemeEvent);
    on<ChangeFontSizeEvent>(_onChangeFontSizeEvent);
    on<InitSettingsEvent>(_onInitSettingsEvent);

    add(const InitSettingsEvent());
  }

  Future<void> _onInitSettingsEvent(
    InitSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final double textScale = await _checkFontSizeUseCase.execute(
      const NoParams(),
    );
    final bool isDark = await _checkThemeUseCase.execute(
      const NoParams(),
    );
    emit(
      state.copyWith(
        themeData: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
        textScale: textScale,
      ),
    );
  }

  Future<void> _onChangeThemeEvent(
    ChangeThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _setThemeUseCase.execute(event.isDark);
    emit(
      state.copyWith(
        isDark: event.isDark,
        themeData: event.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      ),
    );
  }

  Future<void> _onChangeFontSizeEvent(
    ChangeFontSizeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _setFontSizeUseCase.execute(event.textScale);
    emit(state.copyWith(textScale: event.textScale));
  }
}
