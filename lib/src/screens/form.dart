import 'package:flutter/material.dart';
import 'form_state.dart';

class Formui extends StatelessWidget {
  const Formui({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: const Text(
            'Form',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Formstate(),
      ),
    );
  }
}
