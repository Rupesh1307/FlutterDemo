// ignore_for_file: must_be_immutable

import 'package:demo/src/blocs/loginbloc/login_bloc.dart';
import 'package:demo/src/blocs/loginbloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/loginbloc/login_event.dart';

class BlocLogin extends StatelessWidget {
  BlocLogin({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                BlocBuilder<LoginBloc, BlocLoginState>(
                    builder: (context, state) {
                  return emailTextField(context, state);
                }),
                BlocBuilder<LoginBloc, BlocLoginState>(
                    builder: (context, state) {
                  return passwordTextField(context, state);
                }),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                ),
                BlocBuilder<LoginBloc, BlocLoginState>(
                    builder: (context, state) {
                  return submitButton(context, state);
                }),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                ),
                BlocBuilder<LoginBloc, BlocLoginState>(
                    builder: (context, state) {
                  if (state is LoginSubmitState) {
                    return Text("Right");
                  } else {
                    return Text('Wrong');
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailTextField(context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            label: Text('Email'),
            hintText: 'abc@example.com',
          ),
          onChanged: (value) {
            BlocProvider.of<LoginBloc>(context)
                .add(LoginEmailChangeEvent(emailController.text));
          },
        ),
        (state is LoginEmailErrorState)
            ? Text(
                state.emailError,
                style: const TextStyle(color: Colors.red),
              )
            : Container(),
      ],
    );
  }

  Widget passwordTextField(context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
            label: Text('Password'),
            hintText: 'Enter password',
          ),
          onChanged: (value) {
            BlocProvider.of<LoginBloc>(context)
                .add(LoginPasswordChangeEvent(passwordController.text));
          },
          obscureText: true,
        ),
        (state is LoginPasswordErrorState)
            ? Text(
                state.passwordError,
                style: const TextStyle(color: Colors.red),
              )
            : Container(),
      ],
    );
  }

  Widget submitButton(context, state) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
          primary:
              (state is LoginEmailValidState) ? Colors.lightGreen : Colors.red,
          elevation: 5,
        ),
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(LoginSubmitEvent());
        },
        child: const Text(
          'Submit',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
