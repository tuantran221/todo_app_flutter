import 'package:flutter/material.dart';
import 'package:flutter_todo_application/model/todo.dart';
import 'package:flutter_todo_application/constant/custom_theme.dart';
class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onTodoChanged;
  final onDeleteItem;
  final onEditItem;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTodoChanged,
    required this.onDeleteItem,
    required this.onEditItem(),
  }) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: CustomTheme.getTheme().cardColor,
        onTap: () {
          onTodoChanged(todo);
        },
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          todo.date,
          style: CustomTheme.getTheme().textTheme.bodySmall,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  onEditItem();
                  print('click edit');
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  onDeleteItem(todo.id);
                  print('click delete');
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
