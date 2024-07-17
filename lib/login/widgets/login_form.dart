import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 45,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: SvgPicture.asset(
                'assets/images/login/email_icon.svg',
                width: 29.0,
                height: 29.0,
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
            decoration: InputDecoration(
              prefixIcon: SvgPicture.asset(
                'assets/images/login/key_icon.svg',
                width: 29,
                height: 29,
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
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 40),
              backgroundColor: const Color(0xFFCDCDCD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              )),
          child: const Text(
            '로그인',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 12,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
