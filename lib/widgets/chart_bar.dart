import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double speandingAmount;
  final double speandingPctOfAmount;
  const ChartBar(
    this.label,
    this.speandingAmount,
    this.speandingPctOfAmount, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: constrains.maxHeight * 0.15,
              child: FittedBox(
                child: FittedBox(
                  child: Text('\$${speandingAmount.toStringAsFixed(0)}'),
                ),
              ),
            ),
            SizedBox(height: constrains.maxHeight * 0.04),
            SizedBox(
              height: constrains.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: speandingPctOfAmount,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constrains.maxHeight * 0.05),
            SizedBox(
              height: constrains.maxHeight * 0.12,
              child: FittedBox(child: Text(label)),
            ),
          ],
        );
      },
    );
  }
}
