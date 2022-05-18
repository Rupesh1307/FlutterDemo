// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormTextInput extends StatelessWidget {
  final String? hintText, label;
  final TextEditingController? inputController;
  final bool? obscureText;
  var icon;
  var validator;
  var onSave;
  // var onchange;
  var keyboardType;
  FormTextInput({
    Key? key,
    this.label,
    this.hintText,
    this.inputController,
    this.obscureText,
    this.keyboardType,
    this.icon,
    this.validator,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        controller: inputController,
        decoration: InputDecoration(
          label: Text('$label'),
          labelStyle: const TextStyle(color: Colors.purple),
          hintText: '$hintText',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.purple,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.purple,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.purple,
              width: 2.0,
            ),
          ),
          prefixIcon: Icon(icon),
          prefixIconColor: Color.fromARGB(255, 6, 10, 0),
        ),
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSave,
      ),
    );
  }
}
