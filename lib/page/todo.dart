import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Todo extends StatefulWidget {
  const Todo({var key}) : super(key: key);

  final String serverHost = 'http://ooake9xses.laravel-sail.site:8080';

  Future<List> getTasks() async {
    todoList = [];

    var response =
    await http.get(Uri.parse(serverHost + '/api/task'), headers: {
      'Accept': 'application/json',
    });

    var result = jsonDecode(response.body);

    result['data'].forEach((element) {
      todoList.add(element);
    });

    return todoList;
  }

  void addTask(task) async {
    var response = await http.post(Uri.parse(serverHost + '/api/task'),
        headers: {
          'Accept': 'application/json',
        },
        body: task);

    var result = jsonDecode(response.body)['data'];

    // todoList.add(result);
  }

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List todoList = [];
  String userToDo = '';

  @override
  void initState() {
    super.initState();

    this.getTasks();
  }

  void setToDoList(listData) {
    todoList = listData;
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
            return ListView.builder(
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
