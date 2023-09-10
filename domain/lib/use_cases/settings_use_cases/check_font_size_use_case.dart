import 'package:domain/domain.dart';

class CheckFontSizeUseCase extends FutureUseCase<double, NoParams> {
  final SettingsRepository _settingsRepository;

  CheckFontSizeUseCase({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  @override
  Future<double> execute(NoParams params) {
    return _settingsRepository.checkFontSize();
  }
}
