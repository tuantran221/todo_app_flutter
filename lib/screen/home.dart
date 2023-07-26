import 'package:flutter/material.dart';
import 'package:flutter_todo_application/widget/todo_item.dart';
import 'package:flutter_todo_application/model/todo.dart';
import '../constant/crud_function.dart';

class Home extends StatefulWidget {
  final bool isDark;

  const Home({Key? key, this.isDark = true}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
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
      addTodoItem(todo, todoList, context);
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
  Widget build(BuildContext context) {
    bool isDark = widget.isDark; // Extracting isDark from widget

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: isDark ? Colors.white : Color.fromARGB(255, 51, 51, 51),
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/alexander-hipp-iEEBWgY_6lA-unsplash.jpg',
                ),
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
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
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
                    margin: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 0.0),
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: _todoController,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 97, 97, 97),
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type here",
                        contentPadding: EdgeInsets.only(left: 20),
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 97, 97, 97),
                        ),
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
