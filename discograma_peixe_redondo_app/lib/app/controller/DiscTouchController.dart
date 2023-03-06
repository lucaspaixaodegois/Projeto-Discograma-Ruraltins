// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DiscTouchController extends StatefulWidget {
  const DiscTouchController({super.key});

  @override
  State<DiscTouchController> createState() => _DiscTouchControllerState();
}

class _DiscTouchControllerState extends State<DiscTouchController> {
  double finalAngle = 0.0;
  double oldAngle = 0.0;
  double upsetAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Offset centerOfGestureDetector =
            Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);
        return GestureDetector(
          onPanStart: (details) {
            final touchPositionFromCenter =
                details.localPosition - centerOfGestureDetector;
            upsetAngle = oldAngle - touchPositionFromCenter.direction;
          },
          onPanEnd: (details) {
            setState(
              () {
                oldAngle = finalAngle;
              },
            );
          },
          onPanUpdate: (details) {
            final touchPositionFromCenter =
                details.localPosition - centerOfGestureDetector;

            setState(
              () {
                finalAngle = touchPositionFromCenter.direction + upsetAngle;
              },
            );
          },
         
        );
      },
    );
  }
}
