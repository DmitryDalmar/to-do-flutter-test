import 'package:flutter/material.dart';
import 'package:to_do_flutter_test/page/todo.dart';
import 'package:to_do_flutter_test/page/login.dart';

void main() {
  return runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.indigo
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/todo': (context) => Todo(),
    },
  ));
}
