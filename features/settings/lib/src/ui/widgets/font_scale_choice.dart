import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class FontScaleChoice extends StatelessWidget {
  const FontScaleChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (_, SettingsState state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              AppString.fontSize,
              style: AppTextTheme.font22,
            ),
            Slider(
              value: state.textScale,
              min: AppScale.scaleZero8,
              max: AppScale.scaleOne2,
              onChanged: (double textScale) {
                bloc.add(
                  ChangeFontSizeEvent(textScale: textScale),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
