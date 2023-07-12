class ToDo {
  String id;
  String todoText;
  bool isDone;


  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){     
     return[
        ToDo(id: '01',todoText: 'buy a tikcet', isDone: true ),
        ToDo(id: '01',todoText: 'buy a home', isDone: true ),
        ToDo(id: '01',todoText: 'buy a cat', isDone: true ),
        ToDo(id: '01',todoText: 'buy a dog' ),
        ToDo(id: '01',todoText: 'buy a toy'),
      ];
  }
}