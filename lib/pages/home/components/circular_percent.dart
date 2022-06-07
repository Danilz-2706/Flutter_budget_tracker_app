import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercent extends StatelessWidget {
  const CircularPercent({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: CircularPercentIndicator(
        radius: screenSize.width / 2,
        lineWidth: 10.0,
        percent: .5,
        backgroundColor: Colors.white,
        center: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "\$0",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text(
              "Balance",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        progressColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
