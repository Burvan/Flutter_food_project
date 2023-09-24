import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OfferAnotherScreen extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final String question;

  const OfferAnotherScreen({
    required this.onPressed,
    required this.buttonText,
    required this.question,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          question,
          style: AppTextTheme.font18Grey,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: AppTextTheme.font18Pink,
          ),
        ),
      ],
    );
  }
}
