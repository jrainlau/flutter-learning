import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todolist_bloc/blocs/counter_bloc.dart';

class Second extends StatelessWidget {
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Second Page'),),
      body: Center(
        child: Text(
          '${counterBloc.counter}',
          style: TextStyle(fontSize: 62.0),
        )
      ),
    );
  }
}