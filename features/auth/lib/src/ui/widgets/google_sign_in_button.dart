import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  void Function()? onTap;

  GoogleSignInButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: onTap,
          child: Image.asset(
            AppString.googleIconPath,
            width: AppSize.size100,
            height: AppSize.size100,
          ),
        ),
        Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(
              AppBorderRadius.borderRadius25,
            ),
            child: const SizedBox(
              width: AppSize.size100,
              height: AppSize.size100,
            ),
          ),
        ),
      ],
    );
  }
}
