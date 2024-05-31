import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestCubit extends Cubit<TestCubitState> {
  TestCubit() : super(const TestCubitState(0));

  void increment() => emit(TestCubitState(state.count + 1));
}

class TestCubitState extends Equatable {
  final int count;
  const TestCubitState(this.count);
  @override
  List<Object?> get props => [count];
}