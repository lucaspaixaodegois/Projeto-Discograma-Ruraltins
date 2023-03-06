// ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names

import 'package:flutter/cupertino.dart';

class DiscBaseMonthModel extends StatelessWidget {
  const DiscBaseMonthModel({super.key});

  @override
  Widget build(BuildContext context) {
    String disc_base = "assets/image/discs/discMonth/disc_base_month.png";
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
