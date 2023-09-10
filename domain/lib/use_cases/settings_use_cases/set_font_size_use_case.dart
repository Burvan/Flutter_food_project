import 'package:domain/domain.dart';

class SetFontSizeUseCase extends FutureUseCase<void, double> {
  final SettingsRepository _settingsRepository;

  SetFontSizeUseCase({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(double textScale) {
    return _settingsRepository.setFontSize(textScale);
  }
}
