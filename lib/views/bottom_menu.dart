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
        onTap: () => {}),
    _ButtonData(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Настройки',
        ),
        onTap: () => {}),
    _ButtonData(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Пользователь',
        ),
        onTap: () => {})
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _buttons[index].onTap();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _buttons.map((e) => e.bottomNavigationBarItem).toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}

class _ButtonData {
  BottomNavigationBarItem bottomNavigationBarItem;
  Function onTap;

  _ButtonData({required this.bottomNavigationBarItem, required this.onTap});
}
