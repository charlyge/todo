import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/Todo.dart';
import 'package:todo/utils/DbHelper.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State {
  DbHelper helper = DbHelper();
  int count;
  List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = List<Todo>();
      getData();
    }
    return Scaffold(
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: "Add new Todo",
        child: new Icon(Icons.add),
      ),
    );
  }

  ListView todoListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        if(todos.isEmpty){
          return Card();
        }
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(this.todos[position].id.toString()),
            ),
            title: Text(todos[position].title),
            subtitle: Text(todos[position].date) ,
            onTap: (){
              debugPrint("Tapped on " + todos[position].id.toString());
            },
          ),
        );
      },
    );
  }

  void getData() {
    final dbFuture = helper.intializeDb();
    dbFuture.then((value) {
      helper.getTodos().then((value) {
        count = value.length;
        List<Todo> todosList = <Todo>[];
        for (int i = 0; i < value.length; i++) {
          todosList.add(Todo.fomObject(value[i]));
          debugPrint(todosList[i].title);
        }
        setState(() {
          todos = todosList;
          count = count;
        });
        debugPrint("count" + count.toString());
      });
    });
  }
}
