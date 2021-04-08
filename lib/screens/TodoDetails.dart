import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/Todo.dart';

class TodoDetail extends StatefulWidget {
  final Todo todo;

  TodoDetail(this.todo);

  @override
  State<StatefulWidget> createState() => TodoDetailState(todo);
}

class TodoDetailState extends State {
  Todo todo;
  final priorities = ["High", "Medium", "Low"];
  String priority = "low";

  TodoDetailState(this.todo);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.desc;
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(todo.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            style: textStyle,
            decoration: InputDecoration(
                labelText: "Title",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
          ),
          TextField(
            controller: titleController,
            style: textStyle,
            decoration: InputDecoration(
                labelText: "Description",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
          ),
          DropdownButton<String>(
            items: priorities.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            style: textStyle,
            value: "low",
            onChanged: null,
          ),
        ],
      ),
    );
  }
}
