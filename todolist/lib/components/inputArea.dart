import 'package:flutter/material.dart';

createInputArea(controller, cb) {
  return Row(children: <Widget>[
    Flexible(
      child: TextField(
        controller: controller,
        onSubmitted: (v) {
          cb(controller.value.text);
          controller.clear();
        },
      )
    ),
    Container(
      margin: EdgeInsets.only(left: 10.0),
      child: FlatButton(
        child: Text('Submit'),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: (){
          cb(controller.value.text);
          controller.clear();
        }
      )
    )
  ]);
}
