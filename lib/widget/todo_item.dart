import 'package:flutter/material.dart';
import 'package:flutter_todo_application/model/todo.dart';
class TodoItem extends StatelessWidget {
  final ToDo todo ;
  const TodoItem( {Key? key, required this.todo}): super(key: key);
 
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Color.fromARGB(255, 255, 255, 255),
        onTap: () {
          print('click');
        },
        title:  Text( todo.todoText,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            )),
        subtitle: const Text(
          "22/07/2023",
          style: TextStyle(fontSize: 12),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {print('click edit button');}, icon: const Icon(Icons.edit)),
            IconButton(onPressed: () {print('click delete button');}, icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
