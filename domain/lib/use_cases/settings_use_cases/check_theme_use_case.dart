import 'package:domain/domain.dart';

class CheckThemeUseCase extends FutureUseCase<bool, NoParams> {
  final SettingsRepository _settingsRepository;

  CheckThemeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<bool> execute(NoParams params) async{
    return _settingsRepository.checkTheme(params);
  }
}
