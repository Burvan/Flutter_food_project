import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonText;
  final void Function()? onTap;
  final TextStyle? textStyle;

  const AuthButton({
    required this.width,
    required this.height,
    required this.buttonText,
    required this.onTap,
    required this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppBorderRadius.borderRadius25,
            ),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                AppColors.brightPink,
                AppColors.gentlyPink,
                AppColors.pinkSherbet,
                AppColors.skyBlue,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.padding12),
            child: Text(
              buttonText,
              style: textStyle,
            ),
          ),
        ),
        Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(
              AppBorderRadius.borderRadius25,
            ),
            child: SizedBox(
              width: width,
              height: height,
            ),
          ),
        ),
      ],
    );
  }
}
