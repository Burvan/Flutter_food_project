import 'package:core/core.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState(isDark: false)) {
    on<ChangeThemeEvent>(_onChangeThemeEvent);
  }

  Future<void> _onChangeThemeEvent(
    ChangeThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      state.copyWith(isDark: !state.isDark),
    );
  }
}
