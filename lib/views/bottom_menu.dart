import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  final List<_ButtonData> _buttons = [
    _ButtonData(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Задачи',
        ),
        route: '/todo'),
    _ButtonData(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Настройки',
        ),
        route: '/settings'),
    _ButtonData(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Пользователь',
        ),
        route: '/user'),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _buttons.map((e) => e.bottomNavigationBarItem).toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });

        Navigator.pushNamed(context, _buttons[index].route);
      },
    );
  }
}

class _ButtonData {
  BottomNavigationBarItem bottomNavigationBarItem;
  String route;

  _ButtonData({required this.bottomNavigationBarItem, required this.route});
}
