import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, BlocLoginState> {
  LoginBloc() : super(LoginInitalState()) {
    //Email
    on<LoginEmailChangeEvent>((event, emit) {
      if (event.emailValue == null || event.emailValue.isEmpty) {
        emit(LoginEmailErrorState('Email filed is required'));
      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(event.emailValue)) {
        emit(LoginEmailErrorState('Please enter the vaild email.'));
      } else {
        emit(LoginEmailValidState());
      }
    });

//Password
    on<LoginPasswordChangeEvent>((event, emit) {
      if (event.passwordValue == null || event.passwordValue.isEmpty) {
        emit(LoginPasswordErrorState('Password filed is required'));
      } else if (!RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(event.passwordValue)) {
        emit(LoginPasswordErrorState('Please enter the vaild Password.'));
      } else {
        emit(LoginPasswordValidState());
      }
    });

    //Submit
    on<LoginSubmitEvent>((event, emit) => {emit(LoginSubmitState())});
  }
}
