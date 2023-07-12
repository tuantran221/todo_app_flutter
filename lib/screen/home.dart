import 'package:flutter/material.dart';
import 'package:flutter_todo_application/widget/todo_item.dart';
import 'package:flutter_todo_application/model/todo.dart';
import 'package:flutter_todo_application/constant/custom_theme.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();

  // Function for CRUD(Create,Update and Delete)
  void _handleOnchanged(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String todo) {
    setState(() {
      if (todo.isNotEmpty) {
        todoList.add(ToDo(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            date: DateTime.now().toString().substring(0, 10),
            todoText: todo));
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: AlertDialog(
                  title: Center(
                    child: const Text('Please enter your job',
                        style: TextStyle(fontSize: 19, color: Color.fromARGB(255, 241, 68, 68))),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            });
      }
    });
    _todoController.clear();
  }

  void _editTodoItem(ToDo todo) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController editController =
            TextEditingController(text: todo.todoText);
        return AlertDialog(
          title: const Text('Update your job'),
          content: TextField(
            controller: editController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  todo.todoText = editController.text;
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

// UI/UX of Todo Application
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: CustomTheme.getTheme().primaryColor,
      appBar: AppBar(
        backgroundColor: CustomTheme.getTheme().primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 51, 51, 51),
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                    'assets/images/alexander-hipp-iEEBWgY_6lA-unsplash.jpg'),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 20),
                        child: const Text(
                          'All List To Do',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ToDo todoo in todoList)
                        TodoItem(
                          todo: todoo,
                          onTodoChanged: _handleOnchanged,
                          onDeleteItem: _deleteTodoItem,
                          onEditItem: () => _editTodoItem(todoo),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 0.0 // Shadow position
                            ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: "Enter your job here",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      _addTodoItem(_todoController.text);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
