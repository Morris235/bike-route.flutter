import 'package:flutter/material.dart';
import 'package:bike_route/signup/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) => Column(
        children: [
          SizedBox(
            width: 300,
            height: 45,
            child: TextField(
              onChanged: (value) {
                context.read<SignupBloc>().add(SignupNameChanged(value));
              },
              decoration: const InputDecoration(
                hintText: '이름',
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xffCDCDCD),
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xFF000000),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            height: 45,
            child: TextField(
              onChanged: (value) {
                context.read<SignupBloc>().add(SignupEmailChanged(value));
              },
              decoration: const InputDecoration(
                hintText: '이메일 주소',
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xffCDCDCD),
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xFF000000),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            height: 45,
            child: TextField(
              onChanged: (value) {
                context.read<SignupBloc>().add(SignupPasswordChanged(value));
              },
              decoration: const InputDecoration(
                hintText: '비밀번호 입력',
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xffCDCDCD),
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xFF000000),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            height: 45,
            child: TextField(
              onChanged: (value) {
                context.read<SignupBloc>().add(SignupPwdCheckChanged(value));
              },
              decoration: const InputDecoration(
                hintText: '비밀번호 확인',
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xffCDCDCD),
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xFF000000),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 50),
              backgroundColor: state.isFormEmpty
                  ? const Color(0xFFCDCDCD)
                  : const Color(0xFF2F73D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              '가입하기',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
