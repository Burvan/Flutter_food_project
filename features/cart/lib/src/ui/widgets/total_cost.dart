import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TotalCost extends StatelessWidget {
  final double totalCost;
  final VoidCallback onPressed;
  const TotalCost({
    Key? key,
    required this.totalCost,
    required this.onPressed,
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
            //const Divider(thickness: AppSize.size2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Total cost: ',
                  style: AppTextTheme.font18Bold,
                ),
                Text(
                  //'$totalCost BYN'.toString(),
                  '${totalCost.toStringAsFixed(2)} BYN',
                  style: AppTextTheme.font18Bold,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Make an order'),
            ),
          ],
        ),
      ),
    );
  }
}