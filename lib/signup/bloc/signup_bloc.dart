import 'dart:async';

import 'package:bike_route/modules/form_inputs/email.dart';
import 'package:bike_route/modules/form_inputs/password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<SignupNameChanged>(_onNameChanged);
    on<SignupEmailChanged>(_onEmailChanged);
    on<SignupPasswordChanged>(_onPasswordChanged);
    on<SignupPwdCheckChanged>(_onPwdCheckChanged);
  }

  void _onNameChanged(SignupNameChanged event, Emitter<SignupState> emit) {
    final String name = event.name;
    emit(state.copyWith(name: name));
  }

  FutureOr<void> _onEmailChanged(
      SignupEmailChanged event, Emitter<SignupState> emit) {
    final Email email = Email.dirty(event.email);
    emit(state.copyWith(email: email, valid: Formz.validate([email])));
  }

  FutureOr<void> _onPasswordChanged(
      SignupPasswordChanged event, Emitter<SignupState> emit) {
    final Password password = Password.dirty(event.password);
    emit(state.copyWith(password: password, valid: Formz.validate([password])));
  }

  FutureOr<void> _onPwdCheckChanged(
      SignupPwdCheckChanged event, Emitter<SignupState> emit) {
    final String pwdCheck = event.pwdCheck;
    emit(state.copyWith(pwdCheck: pwdCheck));
  }
}
