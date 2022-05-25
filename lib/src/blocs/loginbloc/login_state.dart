abstract class BlocLoginState {}

class LoginInitalState extends BlocLoginState {}

class LoginEmailValidState extends BlocLoginState {}

class LoginEmailErrorState extends BlocLoginState {
  final String emailError;
  LoginEmailErrorState(this.emailError);
}

class LoginPasswordValidState extends BlocLoginState {}

class LoginPasswordErrorState extends BlocLoginState {
  final String passwordError;
  LoginPasswordErrorState(this.passwordError);
}

class LoginSubmitState extends BlocLoginState {}
