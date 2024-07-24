import 'package:bike_route/signup/bloc/signup_bloc.dart';
import 'package:bike_route/signup/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '가입하기',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 51,
            ),
            SignupForm()
          ],
        ),
      ),
    );
  }
}
