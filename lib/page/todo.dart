import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Todo extends StatefulWidget {
  const Todo({var key}): super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List todoList = [];
  String userToDo = '';

  void getTasks() async {
    var response = await http.get(Uri.parse('http://r9wnexeh1u.laravel-sail.site:8080/api/task'), headers: {
      'Accept': 'application/json',
    });

    var result = jsonDecode(response.body);

    result['data'].forEach((element) {
      element['uniqueKey'] = UniqueKey();

      todoList.add(element);
    });
  }

  @override
  void initState() {
    super.initState();

    this.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[1000],
      appBar: AppBar(
        title: const Text('Распил налогов'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]['uniqueKey'].toString()),
                child: Card(
                  child: ListTile(
                      title: Text(todoList[index]['title']),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                        ),
                        onPressed: () => {
                          setState(() {
                            todoList.removeAt(index);
                          })
                        },
                      ),
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    todoList.removeAt(index);
                  });
                },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Добавить налог'),
              content: TextField(
                onChanged: (String value) {
                  userToDo = value;
                }
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() => {
                      todoList.add({'title': userToDo, 'uniqueKey': UniqueKey()})
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Поставить народ на счетчик'),
                )
              ],
            );
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}