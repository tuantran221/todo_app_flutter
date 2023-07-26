import 'package:flutter/material.dart';
import 'package:flutter_todo_application/model/todo.dart';

void addTodoItem(todo, todoList, context) {
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
              title: const Center(
                child: Text('Please enter your job',
                    style: TextStyle(
                        fontSize: 19, color: Color.fromARGB(255, 241, 68, 68))),
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
}

void editTodoItem(todo,context){
  
}