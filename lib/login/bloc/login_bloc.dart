import 'package:bike_route/login/bloc/login_event.dart';
import 'package:bike_route/login/bloc/login_state.dart';
import 'package:bike_route/modules/form_inputs/lib/email.dart';
import 'package:bike_route/modules/form_inputs/lib/password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(email: email, valid: Formz.validate([email])));
  }

  void _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(password: password, valid: Formz.validate([password])));
  }
}
