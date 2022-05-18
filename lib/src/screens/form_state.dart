import 'package:demo/src/widgets/elevatedBtn.dart';
import 'package:demo/src/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../mixins/validation_mixin.dart';
import 'apicall.dart';

class Formstate extends StatefulWidget {
  const Formstate({Key? key}) : super(key: key);

  @override
  createState() {
    return FormStateScreen();
  }
}

class FormStateScreen extends State<Formstate> with ValidationMixin {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              FormTextInput(
                hintText: 'xyz@example.com',
                label: 'Email Address',
                // inputController: emailController,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email,
                validator: EmailValiadtion,
                onSave: (value) {
                  email = value;
                },
              ),
              FormTextInput(
                hintText: 'Enter your password',
                label: 'Password',
                //inputController: passwordController,
                obscureText: true,
                icon: Icons.lock,
                validator: PasswordValidation,
                onSave: (value) {
                  password = value;
                },
              ),
              ElevatedBtn(
                btnText: 'Submit',
                onPressed: () {
                  // print('Submitted !');
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // showCupertinoModalPopup(
                    //   context: context,
                    //   builder: (BuildContext context) => CupertinoAlertDialog(
                    //     title: const Text('Success'),
                    //     content: Text(
                    //         'Email:=> $email  And  Password :=> $password'),
                    //     actions: <CupertinoDialogAction>[
                    //       CupertinoDialogAction(
                    //         isDefaultAction: true,
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         },
                    //         child: const Text('No'),
                    //       ),
                    //       CupertinoDialogAction(
                    //         isDestructiveAction: true,
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         },
                    //         child: const Text('Yes'),
                    //       )
                    //     ],
                    //   ),
                    // );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Apicall()));
                    formKey.currentState!.reset();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
