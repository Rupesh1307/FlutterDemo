import 'package:flutter/material.dart';
import 'src/screens/app.dart';
import 'src/screens/login.dart';
import 'src/screens/apicall.dart';
import 'src/screens/form.dart';
import 'src/screens/bloc_login.dart';

void main() {
  runApp(MaterialApp(title: 'Apicall', home: BlocLogin()));
  //runApp(Apicall());
}
