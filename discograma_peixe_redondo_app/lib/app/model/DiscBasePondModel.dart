// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class DiscBasePondModel extends StatelessWidget {
  const DiscBasePondModel({super.key});

  @override
  Widget build(BuildContext context) {
    String disc_base = "assets/image/discs/discPond/disc_base_pond.png";
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            margin: const EdgeInsets.all(7),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Image.asset(disc_base),
            ),
          ),
        ),
      ],
    );
  }
}
