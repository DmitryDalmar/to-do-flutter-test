import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({var key}): super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[1000],
      appBar: AppBar(
        title: Text('Распил налогов. Вход'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50)),
                CircleAvatar(
                  backgroundImage: NetworkImage('http://tltgorod.ru/pics/600_09A4016F-1AA7-437A-B6AF-D5D5DE4B848E_mw800_s_c225509.jpg'),
                  radius: 80,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(onPressed: () => {
                  Navigator.pushNamed(context, '/todo')
                }, child: Text('Пора пилить'))
              ],
            )
          ],
        )
      )
    );
  }
}