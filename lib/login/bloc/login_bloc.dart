import 'package:bike_route/modules/form_inputs/lib/email.dart';
import 'package:bike_route/modules/form_inputs/lib/password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final Email email = Email.dirty(event.email);
    emit(state.copyWith(email: email, valid: Formz.validate([email])));
  }

  void _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    final Password password = Password.dirty(event.password);
    emit(state.copyWith(password: password, valid: Formz.validate([password])));
  }
}

/*
 void _onSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    if (!state.valid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final GraphQLClient client = GraphQLService.client;
      final MutationOptions options = MutationOptions(
        document: gql(loginMutation),
        variables: <String, dynamic>{
          'email': state.email.value,
          'password': state.password.value,
        },
      );
      final QueryResult result = await client.mutate(options);
      if (result.hasException) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: result.exception.toString()));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: e.toString()));
    }
  }
*/