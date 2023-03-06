// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../view/HomeView.dart';
import '../view/DiscPondView.dart';
import '../view/DiscMonthView.dart';

class MenuController extends StatefulWidget {
  const MenuController({super.key});

  @override
  State<MenuController> createState() => _MenuControllerState();
}

class _MenuControllerState extends State<MenuController> {
  int _indexMenuBar = 0;

  static const List<Widget> _opcMenuBar = <Widget>[
    DiscPondView(),
    DiscMonthView(),
    Homeview(),
  ];

  void _menuBarTouch(int index) {
    setState(() {
      _indexMenuBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _opcMenuBar.elementAt(_indexMenuBar),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(0, 100, 60, 100),
            icon: Icon(Icons.water),
            label: 'Tanque - m² ',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(0, 100, 60, 100),
            icon: Icon(Icons.auto_graph_outlined),
            label: 'Peixe - Kg',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(0, 100, 60, 100),
            icon: Icon(Icons.menu_book),
            label: 'Sobre',
          ),
        ],
        currentIndex: _indexMenuBar,
        selectedItemColor: const Color.fromRGBO(0, 100, 60, 100),
        onTap: _menuBarTouch,
      ),
    );
  }
}
