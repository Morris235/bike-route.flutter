import 'package:bike_route/login/view/login_form.dart';
import 'package:flutter/material.dart';
export './view/view.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bike Route",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 85,
          ),
          LoginForm(),
        ],
      ),
    );
  }
}
