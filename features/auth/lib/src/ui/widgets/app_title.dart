import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Column(
      children: <Widget>[
        SizedBox(
          height: mediaQuery.size.height / AppSize.size5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              AppString.signInTitle,
              style: AppTextTheme.font28WhiteBold,
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppPadding.padding12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    AppString.logoPath,
                    color: AppColors.white,
                    width: AppSize.size12,
                  ),
                  const SizedBox(width: AppSize.size2),
                  Image.asset(
                    AppString.logoPath,
                    color: AppColors.white,
                    width: AppSize.size12,
                  ),
                  const SizedBox(width: AppSize.size2),
                  Image.asset(
                    AppString.logoPath,
                    color: AppColors.white,
                    width: AppSize.size12,
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
