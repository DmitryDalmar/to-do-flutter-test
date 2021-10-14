import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({var key}): super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List todoList = [];
  String userToDo = '';

  void initState() {
    super.initState();

    todoList.addAll(['Новый парк', 'Плиточка', 'Новая церковь']);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[1000],
      appBar: AppBar(
        title: Text('Распил налогов'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(
                      title: Text(todoList[index]),
                      trailing: IconButton(
                        icon: Icon(
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
              title: Text('Добавить налог'),
              content: TextField(
                onChanged: (String value) {
                  userToDo = value;
                }
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() => {
                      todoList.add(userToDo)
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Поставить народ на счетчик'),
                )
              ],
            );
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}