import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_flutter_test/models/task.dart';
import 'package:to_do_flutter_test/services/task_service.dart';

class Todo extends StatefulWidget {
  const Todo({var key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  static final _taskService = TaskService();

  List<Task> _list = <Task>[];
  bool _isLoading = false;
  String _newTaskTitle = '';

  @override
  void initState() {
    super.initState();

    _getTasks();
  }

  _getTasks() async {
    setState(() {
      _isLoading = true;
    });

    _list = await _taskService.getTasks();

    setState(() {
      _isLoading = false;
    });
  }

  _addTask(String title) async {
    await _taskService.addTask(title);
    _getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[1000],
      appBar: AppBar(
        title: const Text('Распил налогов'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          if (_isLoading) {
            return const Text('Loading...');
          } else {
            return ListView.builder(
                itemCount: _list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(_list[index].id.toString()),
                    child: Card(
                      child: ListTile(
                        title: Text(_list[index].title),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),
                          onPressed: () => {
                            setState(() {
                              _list.removeAt(index);
                            })
                          },
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        _list.removeAt(index);
                      });
                    },
                  );
                });
          }
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
                    _newTaskTitle = value;
                  }),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() => {
                              _addTask(_newTaskTitle)
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
