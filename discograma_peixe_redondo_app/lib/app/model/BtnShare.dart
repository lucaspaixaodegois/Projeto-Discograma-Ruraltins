// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class BtnShare extends StatelessWidget {
  const BtnShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(15),
      child: SpeedDial(
        backgroundColor: const Color.fromRGBO(0, 120, 20, 225),
        icon: Icons.share,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.picture_as_pdf_outlined),
            label: 'Compartilhar via PDF',
            onTap: null,
          ),
          SpeedDialChild(
            child: const Icon(Icons.textsms_outlined),
            label: 'Compartilhar via texto',
            onTap: null,
          ),
        ],
      ),
    );
  }
}
