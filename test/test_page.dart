import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'test_cubit.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestCubit>(
      create: (_) => TestCubit(),
      child: Scaffold(
        body: BlocBuilder<TestCubit, TestCubitState>(
          builder: (context, state) {
            return Center(
              child: GestureDetector(
                  onTap: () => context.read<TestCubit>().increment(),
                  child: Text(state.count.toString())),
            );
          },
        ),
      ),
    );
  }
}