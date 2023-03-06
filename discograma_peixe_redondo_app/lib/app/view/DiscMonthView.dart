// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../model/BtnShare.dart';
import '../model/DiscBaseMonthModel.dart';

class DiscMonthView extends StatefulWidget {
  const DiscMonthView({super.key});

  @override
  State<DiscMonthView> createState() => _DiscMonthViewState();
}

class _DiscMonthViewState extends State<DiscMonthView> {
  double finalAngle = 0.0;
  double oldAngle = 0.0;
  double upsetAngle = 0.0;
  String discExternal = "assets/image/discs/discMonth/disc_external.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 120, 20, 225),
      // drawer: const Drawer(        backgroundColor: Color.fromRGBO(0, 120, 20, 200),      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 100, 60, 100),
        title: const Center(child: Text('Calendário dos alevinos')),
      ),
      body: Stack(
        children: <Widget>[
          const DiscBaseMonthModel(),
          Center(
            child: Transform.rotate(
              angle: finalAngle,
              origin: const Offset(0, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 0.65,
                child: Image.asset(discExternal),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              Offset centerOfGestureDetector =
                  Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);
              return GestureDetector(
                // behavior: HitTestBehavior.translucent,
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
                      finalAngle =
                          touchPositionFromCenter.direction + upsetAngle;
                    },
                  );
                },
              );
            },
          ),
          const BtnShare(),
        ],
      ),
    );
  }
}
