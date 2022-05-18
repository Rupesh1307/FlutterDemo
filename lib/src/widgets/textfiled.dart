// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? inputController;
  final bool? obscureText;
  var onchange;
  var keyboardType;
  final String? label;
  final IconData? icon;

  TextInput({
    Key? key,
    this.hintText,
    this.inputController,
    this.obscureText,
    this.onchange,
    this.label,
    this.keyboardType,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
            label: Text('$label'), hintText: hintText, prefixIcon: Icon(icon)),
        controller: inputController,
        obscureText: obscureText ?? false,
        onChanged: onchange,
        keyboardType: keyboardType,
      ),
    );
  }
}
