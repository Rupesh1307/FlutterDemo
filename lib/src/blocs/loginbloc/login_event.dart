abstract class LoginEvent {}

class LoginEmailChangeEvent extends LoginEvent {
  final String emailValue;

  LoginEmailChangeEvent(this.emailValue);
}

class LoginPasswordChangeEvent extends LoginEvent {
  final String passwordValue;

  LoginPasswordChangeEvent(this.passwordValue);
}

class LoginSubmitEvent extends LoginEvent {
  // final String email, password;
  // LoginSubmitEvent(this.email, this.password);
}
