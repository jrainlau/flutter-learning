import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_bloc/widgets/buttons.dart';

import '../blocs/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${counterBloc.counter}',
                style: TextStyle(fontSize: 62.0),
              ),
              IncrementButton(),
              DecrementButton(),
              FlatButton.icon(
                icon: Icon(Icons.navigate_next),
                label: Text('Go to second page'),
                onPressed: () => Navigator.of(context).pushNamed('second'),
              )
            ]
          )
        )
      ),
    );
  }
}