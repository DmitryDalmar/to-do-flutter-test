import 'package:flutter/material.dart';
import 'package:to_do_flutter_test/page/settings.dart';
import 'package:to_do_flutter_test/page/todo.dart';
import 'package:to_do_flutter_test/page/login.dart';
import 'package:to_do_flutter_test/page/user.dart';

void main() {
  return runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.indigo
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/todo': (context) => Todo(),
      '/settings': (context) => Settings(),
      '/user': (context) => User(),
    },
  ));
}
