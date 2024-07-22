import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email];
}