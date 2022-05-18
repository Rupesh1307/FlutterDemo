import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
        title: 'Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Project'),
          ),
        )
    );
  }
}
