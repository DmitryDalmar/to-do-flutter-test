import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({var key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[1000],
      appBar: AppBar(
        title: const Text('Распил налогов. Вход'),
        centerTitle: true,
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText1!,
        child: SafeArea(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://tltgorod.ru/pics/600_09A4016F-1AA7-437A-B6AF-D5D5DE4B848E_mw800_s_c225509.jpg'),
                    radius: 80,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/todo');
                    },
                    child: Text(
                      'Пора пилить',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
