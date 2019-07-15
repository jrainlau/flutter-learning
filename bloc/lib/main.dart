import 'package:flutter/material.dart';
import 'package:todolist_bloc/pages/second.dart';
import './blocs/counter_bloc.dart';
import 'package:provider/provider.dart';

import './pages/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterBloc>.value(
          value: CounterBloc(),
        )
      ],
      child: MaterialApp(
        home: CounterPage(),
        routes: <String, WidgetBuilder>{
          'second': (_) => Second()
        }
      )
    );
  }
}