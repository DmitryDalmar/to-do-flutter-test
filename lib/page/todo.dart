import 'package:flutter/material.dart';
import 'package:to_do_flutter_test/models/task.dart';
import 'package:to_do_flutter_test/services/task_service.dart';
import 'package:to_do_flutter_test/views/bottom_menu.dart';

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
    Task task = await _taskService.addTask(title);

    // _getTasks();

    setState(() {
      _list.insert(0, task);
    });
  }

  _removeTask(int id) async {
    var success = await _taskService.removeTask(id);

    if (success) {
      setState(() {
        _list.removeWhere((task) => task.id == id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[1000],
      appBar: AppBar(
        title: const Text('Задачи'),
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
                  Task task = _list[index];

                  return Dismissible(
                    key: Key(task.id.toString()),
                    child: Card(
                      child: ListTile(
                        title: Text(task.title),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),
                          onPressed: () => _removeTask(task.id),
                        ),
                      ),
                    ),
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
                        _addTask(_newTaskTitle);
                        Navigator.pop(context);
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
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
