import 'package:flutter/material.dart';

class TodoItem {
  bool completed = false;
  String content;
  String date;
  num id;
  TodoItem(this.completed, this.content, this.id, { this.date });
}

createTodoItem(item, onCheckCallback, onCloseCallback) {
  return Container(
    padding: EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(children: <Widget>[
          GestureDetector(
            onTap: () {
              onCheckCallback(item.id);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                item.completed ? Icons.check_box : Icons.check_box_outline_blank,
                size: 30,
                color: item.completed ? Colors.green : Colors.grey,
              )
            )
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 250),
            child: Text(
              '${item.content}',
              style: TextStyle(
                fontSize: 22
              )
            )
          )
        ]),
        GestureDetector(
          onTap: () {
            onCloseCallback(item.id);
          },
          child: Icon(
            Icons.cancel,
            size: 30,
            color: Colors.red[400],
          )
        )
      ],
    ),
  );
}

createTodoList(list, onCheckCallback, onCloseCallback) {
  return Flexible(child: ListView(
    children: List<Widget>.generate(list.length, (i) {
      return createTodoItem(list[i], onCheckCallback, onCloseCallback);
    })
  ));
}