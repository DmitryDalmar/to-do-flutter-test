import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Todo extends StatefulWidget {
  const Todo({var key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  String userToDo = '';
  String serverHost = 'http://t0605klrit.laravel-sail.site:8080';

  @override
  void initState() {
    super.initState();

    getTasks();
  }

  Future<List> getTasks() async {
    var todoList = [];

    var response = await http.get(Uri.parse(serverHost + '/api/task'), headers: {
      'Accept': 'application/json',
    });

    var result = jsonDecode(response.body);

    result['data'].forEach((element) {
      todoList.add(element);
    });

    return todoList;
  }

  void addTask(task) async {
    await http.post(Uri.parse(serverHost + '/api/task'),
        headers: {
          'Accept': 'application/json',
        },
        body: task);

    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[1000],
      appBar: AppBar(
        title: const Text('Распил налогов'),
        centerTitle: true,
      ),
      /*body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]['id'].toString()),
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
      ),*/
      body: FutureBuilder<List>(
        future: getTasks(),
        builder: (context, snapshot) {
          // operation for completed state
          if (snapshot.hasData) {
            List<dynamic> toDoList = snapshot.data ?? [];

            return ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(toDoList[index]['id'].toString()),
                    child: Card(
                      child: ListTile(
                        title: Text(toDoList[index]['title']),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),
                          onPressed: () => {
                            setState(() {
                              toDoList.removeAt(index);
                            })
                          },
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        toDoList.removeAt(index);
                      });
                    },
                  );
                });
          }
          // spinner for uncompleted state
          return Text('text');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Добавить налог'),
                  content: TextField(onChanged: (String value) {
                    userToDo = value;
                  }),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() => {
                              addTask({'title': userToDo})
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
