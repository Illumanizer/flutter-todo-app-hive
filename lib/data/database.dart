import 'package:hive/hive.dart';

class TodoDatabase{
  List todoList=[];
  final _mybox=Hive.box('myBox');

  void createIniitialData(){
    todoList=[["Sample Task",false]];
  }

  void loadTodoList(){
    todoList=_mybox.get('TODOLIST',defaultValue: []);
  }

  void updataTodoList(){
    _mybox.put('TODOLIST', todoList);
  }

}