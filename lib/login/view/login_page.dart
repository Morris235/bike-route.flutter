import 'package:flutter/material.dart';
import 'package:bike_route/login/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
