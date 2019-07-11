import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'components/inputArea.dart';
import 'components/todoList.dart';
import 'components/footerButtons.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
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

enum Filter { all, completed, uncompleted }

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _inputController = TextEditingController();
  List todoList = [];
  List onShowList = [];
  String todoContent;

  var filter = Filter.all;

  num id = 0;

  void addNewTodo (String content) {
    if (content.length == 0) return;
    final now = new DateTime.now();
    final year = now.year;
    final month = now.month;
    final day = now.day;
    final date = '$year-$month-$day';
    todoList.add(new TodoItem(false, content, id++, date: date));

    switchList();
    setState(() {});
  }

  void closeTodo (num id) {
    todoList.removeWhere((item) => item.id == id);
    switchList();
    setState(() {});
  }

  void toogleTodoStatus (num id) {
    setState(() {
      todoList.forEach((item) {
        if (item.id == id) {
          item.completed = !item.completed;
        }
      });
      switchList();
    });
  }

  void switchList () {
    if (filter == Filter.all) {
      onShowList = todoList;
    } else if (filter == Filter.completed) {
      onShowList = todoList.where((item) => item.completed).toList();
    } else if (filter == Filter.uncompleted) {
      onShowList = todoList.where((item) => !item.completed).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: <Widget>[
            createInputArea(_inputController, addNewTodo),
            createTodoList(onShowList, toogleTodoStatus, closeTodo)
          ],
        )
      ),
      persistentFooterButtons: <Widget>[
        createFooterButtons('All', () {
          setState(() {
            filter = Filter.all;
            switchList();
          });
        }),
        createFooterButtons('Completed', () {
          setState(() {
            filter = Filter.completed;
            switchList();
          });
        }),
        createFooterButtons('Uncompleted', () {
          setState(() {
            filter = Filter.uncompleted;
            switchList();
          });
        }),
      ],
    );
  }
 }
