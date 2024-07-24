part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState({
    this.name = '',
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.pwdCheck = '',
    this.status =  FormzSubmissionStatus.initial,
    this.valid = false,
  });

  final String name;
  final Email email;
  final Password password;
  final String pwdCheck;
  final FormzSubmissionStatus status;
  final bool valid;

  @override
  List<Object> get props => [name, email, password, pwdCheck, status, valid];

  bool get isFormEmpty => name.isEmpty || email.value.isEmpty || password.value.isEmpty || pwdCheck.isEmpty;

  SignupState copyWith({
    String? name,
    Email? email,
    Password? password,
    String? pwdCheck,
    FormzSubmissionStatus? status,
    bool? valid,
  }) {
    return SignupState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      pwdCheck: pwdCheck ?? this.pwdCheck,
      status: status ?? this.status,
      valid: valid ?? this.valid,
    );
  }
}
