import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_bloc/blocs/counter_bloc.dart';

class IncrementButton extends StatelessWidget {
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);

    return FlatButton.icon(
      icon: Icon(Icons.add),
      label: Text('Increment'),
      onPressed: () => counterBloc.increment(),
    );
  }
}

class DecrementButton extends StatelessWidget {
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);

    return FlatButton.icon(
      icon: Icon(Icons.remove),
      label: Text('Decrement'),
      onPressed: () => counterBloc.decrement(),
    );
  }
}