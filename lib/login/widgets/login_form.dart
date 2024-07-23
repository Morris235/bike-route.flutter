import 'package:bike_route/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                width: 300,
                height: 45,
                child: TextField(
                  onChanged: (value) {
                    context.read<LoginBloc>().add(LoginEmailChanged(value));
                  },
                  decoration: InputDecoration(
                    prefixIcon: UnconstrainedBox(
                      child: SvgPicture.asset(
                        'assets/images/login/email_icon.svg',
                        width: 29.0,
                        height: 29.0,
                      ),
                    ),
                    hintText: 'E-mail',
                    hintStyle: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xffCDCDCD),
                      fontSize: 12,
                    ),
                    border: const OutlineInputBorder(
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
                    context.read<LoginBloc>().add(LoginPasswordChanged(value));
                  },
                  decoration: InputDecoration(
                    prefixIcon: UnconstrainedBox(
                      child:
                          SvgPicture.asset('assets/images/login/key_icon.svg'),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xffCDCDCD),
                      fontSize: 12,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
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
                  minimumSize: const Size(300, 40),
                  backgroundColor: state.isFormEmpty
                      ? const Color(0xFFCDCDCD)
                      : const Color(0xFF2F73D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  '로그인',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => {},
                    child: const Text(
                      '아이디 찾기',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 91,
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: const Text(
                      '비밀번호 확인',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      indent: 49,
                      endIndent: 12,
                      color: Color(0xFFCDCDCD),
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                    ),
                  ),
                  Flexible(
                    child: Divider(
                      indent: 12,
                      endIndent: 45,
                      color: Color(0xFFCDCDCD),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: SvgPicture.asset('assets/images/login/kakao_login.svg'),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: SvgPicture.asset('assets/images/login/naver_login.svg'),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: SvgPicture.asset('assets/images/login/google_login.svg'),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: SvgPicture.asset('assets/images/login/email_login.svg'),
              ),
            ],
          );
        },
      ),
    );
  }
}
