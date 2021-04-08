import 'package:flutter/material.dart';
import 'package:todo/model/Todo.dart';
import 'package:todo/screens/TodoList.dart';
import 'package:todo/utils/DbHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Todo List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(title: new Text(widget.title),),
       body: TodoList(),
     );
  }
}
