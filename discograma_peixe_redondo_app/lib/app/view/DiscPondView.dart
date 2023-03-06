// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'dart:math';
import '../model/BtnShare.dart';
import '../model/DiscBasePondModel.dart';

class DiscPondView extends StatefulWidget {
  const DiscPondView({super.key});

  @override
  State<DiscPondView> createState() => _DiscPondViewState();
}

class _DiscPondViewState extends State<DiscPondView> {
  double finalAngle = 0.0;
  double oldAngle = 0.0;
  double upsetAngle = 0.0;
  int degrees = 0;
  String discExternal = "assets/image/discs/discPond/disc_external.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 120, 20, 225),
      // drawer: const Drawer(        backgroundColor: Color.fromRGBO(0, 120, 20, 200),      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 100, 60, 100),
        title: const Center(child: Text('Povoamento Peixe do tanque')),
      ),
      body: Stack(
        children: [
          const DiscBasePondModel(),
          Center(
            child: Transform.rotate(
              angle: finalAngle,
              origin: const Offset(0, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.98,
                width: MediaQuery.of(context).size.width * 0.98,
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

                      if (finalAngle * 180 / pi > 0 &&
                          finalAngle * 180 / pi <= 25) {
                        finalAngle = pi / 6;
                        print("=<30º");
                        degrees == 25;
                      }

                      if (finalAngle * 180 / pi > 25 &&
                          finalAngle * 180 / pi <= 45) {
                        finalAngle = pi / 4;
                        print("=<45º");
                        degrees == 45;
                      }

                      // if (finalAngle *360/ pi > 45 &&
                      //     finalAngle *360/ pi <= 60) {
                      //   finalAngle = pi / 3;
                      //   print("=<60º");
                      // }

                      if (finalAngle * 180 / pi > 45 &&
                          finalAngle * 180 / pi <= 90) {
                        finalAngle = pi / 2;
                        print("=<90º");
                        degrees == 90;
                      }

                      // if (finalAngle *360/ pi > 90 &&
                      //     finalAngle *360/ pi <= 120) {
                      //   finalAngle = 2 * pi / 3;
                      //   print("=<120º");
                      // }

                      if (finalAngle * 180 / pi > 90 &&
                          finalAngle * 180 / pi <= 135) {
                        finalAngle = 3 * pi / 4;

                        print("=<135º");
                        degrees == 135;
                      }

                      // if (finalAngle *360/ pi > 135 &&
                      //     finalAngle *360/ pi <= 150) {
                      //   finalAngle = 5 * pi / 6;
                      //   print("=<150º");
                      // }

                      if (finalAngle * 180 / pi > 135 &&
                          finalAngle * 180 / pi <= 180) {
                        finalAngle = pi;
                        print("=<180º");
                        degrees == 180;
                      }
                      // if (finalAngle *360/ pi > 180 &&
                      //     finalAngle *360/ pi <= 210) {
                      //   finalAngle = 7 * pi / 6;
                      //   print("=<210º");
                      // }

                      if (finalAngle * 180 / pi > 180 &&
                          finalAngle * 180 / pi <= 225) {
                        finalAngle = 5 * pi / 4;
                        print("=<225º");
                        degrees == 225;
                      }

                      // if (finalAngle *360/ pi > 225 &&
                      //     finalAngle *360/ pi <= 240) {
                      //   finalAngle = 4 * pi / 3;
                      //   print("=<240º");
                      // }

                      if (finalAngle * 180 / pi > 225 &&
                          finalAngle * 180 / pi <= 270) {
                        finalAngle = 3 * pi / 2;
                        print("=<270º");
                        print(finalAngle);
                        degrees == 270;
                      }

                      // if (finalAngle *360/ pi > 270 &&
                      //     finalAngle *360/ pi <= 300) {
                      //   finalAngle = 5 * pi / 3;
                      //   print("=<300º");
                      // }

                      if (finalAngle * 180 / pi > 270 &&
                          finalAngle * 180 / pi <= 315) {
                        finalAngle = 7 * pi / 4;
                        print("=<315º");
                        degrees == 315;
                      }

                      // if (finalAngle *360/ pi > 315 &&
                      //     finalAngle *360/ pi <= 330) {
                      //   finalAngle = 11 * pi / 6;
                      //   print("=<330º");
                      // }

                      if (finalAngle * 180 / pi > 315 &&
                          finalAngle * 180 / pi <= 360) {
                        finalAngle = 0;
                        print("=<360º");
                        degrees == 360;
                      }
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
