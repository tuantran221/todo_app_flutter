class ToDo {
  String id;
  String todoText;
  String date;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    required this.date,
    this.isDone = false,
  });
  void edit(ToDo updatedTodo) {
    todoText = updatedTodo.todoText;
    date = updatedTodo.date;
  }

  static List<ToDo> todoList() {
    return [
      ToDo(
          id: '01', todoText: 'buy a tikcet', date: "2023-07-17", isDone: true),
      ToDo(id: '02', todoText: 'buy a home', date: "2023-07-17", isDone: true),
      ToDo(id: '03', todoText: 'buy a cat', date: "2023-07-17", isDone: true),
      ToDo(
        id: '04',
        todoText: 'buy a dog',
        date: "2023-07-17",
      ),
      ToDo(id: '05', todoText: 'buy a toy', date: "2023-07-17"),
    ];
  }
}
