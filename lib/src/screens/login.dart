// ignore_for_file: avoid_unnecessary_containers
import 'package:demo/src/screens/apicall.dart';
import 'package:flutter/material.dart';
import '../widgets//textfiled.dart';
import '../widgets/button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  //LoginState({Key? key}) : super(key: key);

  late String email;
  late String password;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //  emailController.text = 'rupesh@transformhub.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 100),
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0),
                ),
              ),
            ),
            Center(
              child: Container(
                  child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextInput(
                        hintText: 'xyz@gmail.com',
                        inputController: emailController,
                        label: 'Email',
                        // onchange: (text) {
                        //   print(text);
                        // },
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.email,
                      ),
                      TextInput(
                        hintText: 'Password',
                        inputController: passwordController,
                        obscureText: true,
                        label: 'Abc@123',
                        // onchange: (text) {
                        //   setState(() {
                        //     passwordController.text = text;
                        //   });
                        // },
                        icon: Icons.lock,
                      ),
                      Button(
                        buttonText: 'Submit',
                        onPressed: () {
                          if (emailController.text ==
                                  'rupesh@transformhub.com' &&
                              passwordController.text == 'Xyz@1234') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Apicall()));
                            emailController.text = '';
                            passwordController.text = '';
                          }
                        },
                      )
                    ],
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
