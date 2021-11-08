import 'package:flutter/material.dart';
import 'package:to_do_flutter_test/page/settings.dart';
import 'package:to_do_flutter_test/page/todo.dart';
import 'package:to_do_flutter_test/page/login.dart';
import 'package:to_do_flutter_test/page/user.dart';
import 'package:to_do_flutter_test/themes/light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme().themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/todo': (context) => const Todo(),
        '/settings': (context) => const Settings(),
        '/user': (context) => const User(),
      },
    );
  }
}
