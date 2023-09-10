import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TotalCost extends StatelessWidget {
  final double totalCost;
  final VoidCallback onMakeAnOrderPressed;
  final VoidCallback onClearCartPressed;

  const TotalCost({
    Key? key,
    required this.totalCost,
    required this.onMakeAnOrderPressed,
    required this.onClearCartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: themeData.primaryColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.padding12,
          right: AppPadding.padding12,
          top: AppPadding.padding10,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  AppString.cartTotalCost,
                  style: AppTextTheme.font18Bold,
                ),
                Text(
                  '${totalCost.toStringAsFixed(2)}${AppString.byn}',
                  style: AppTextTheme.font18Bold,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: onClearCartPressed,
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.lightGrey),
                  ),
                  child: const Text(
                    AppString.clearCart,
                  ),
                ),
                ElevatedButton(
                  onPressed: onMakeAnOrderPressed,
                  child: const Text(
                    AppString.makeAnOrder,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
