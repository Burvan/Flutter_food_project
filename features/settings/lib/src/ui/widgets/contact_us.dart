import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Link(
        uri: Uri.parse(AppString.contactUsLink),
        builder: (_, FollowLink? followLink) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.padding25),
            child: ElevatedButton(
              onPressed: followLink,
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    vertical: AppPadding.padding10,
                    horizontal: AppPadding.padding25,
                  ),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppBorderRadius.borderRadius18,
                    ),
                  ),
                ),
              ),
              child: const Text(
                AppString.contactUs,
                style: AppTextTheme.font22Bold,
              ),
            ),
          );
        });
  }
}
