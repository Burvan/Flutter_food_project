import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MenuTab extends StatelessWidget {
  final String iconPath;

  const MenuTab({
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: AppSize.size80,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.padding12),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(
            AppBorderRadius.borderRadius12,
          ),
        ),
        child: Image.asset(
          iconPath,
        ),
      ),
    );
  }
}
