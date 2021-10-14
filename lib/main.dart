import 'package:flutter/material.dart';
import 'package:test_list_app/page/todo.dart';
import 'package:test_list_app/page/login.dart';

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
