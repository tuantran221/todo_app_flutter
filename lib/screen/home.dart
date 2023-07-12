import 'package:flutter/material.dart';
import 'package:flutter_todo_application/widget/todo_item.dart';
import 'package:flutter_todo_application/model/todo.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final todoList = ToDo.todoList();

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
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
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your job here",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child:  ElevatedButton(
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: (){},
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
