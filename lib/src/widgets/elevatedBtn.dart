// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  final String? btnText;
  var onPressed;
  var sizeBtn;

  ElevatedBtn({Key? key, this.btnText, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sizeBtn = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        '$btnText',
        style: const TextStyle(fontSize: 18),
      ),
      // style: ButtonStyle(
      //   padding: MaterialStateProperty.all<EdgeInsets>(
      //       const EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
      //   backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
      //   shape: MaterialStateProperty.all(
      //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //   ),
      // ),
      style: ElevatedButton.styleFrom(
          primary: Colors.purple,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          minimumSize:
              Size(sizeBtn.width * 90 / 100, sizeBtn.width * 15 / 100)),
    );
  }
}
