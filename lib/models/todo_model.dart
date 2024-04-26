class TodoModel{



  final String todoId;
  final String todoName;
  final bool isChecked;

  TodoModel({required this.todoId, required this.todoName, this.isChecked = false});



  static List<TodoModel> todoListTasks(){

    return [
      TodoModel(todoId: '1', todoName: 'Pray Fajr Prayer', isChecked: true),
      TodoModel(todoId: '2', todoName: 'Breakfast ', isChecked: false),
      TodoModel(todoId: '3', todoName: 'Code For 1 Hour', isChecked: false),
      TodoModel(todoId: '4', todoName: 'Lunch Time', isChecked: false),


    ];






  }



}