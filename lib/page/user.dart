import 'package:flutter/material.dart';
import 'package:to_do_flutter_test/views/bottom_menu.dart';

class User extends StatelessWidget {
  const User({var key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[1000],
      appBar: AppBar(
        title: const Text('Пользователь'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }

}