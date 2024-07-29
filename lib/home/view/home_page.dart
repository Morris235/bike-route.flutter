import 'package:bike_route/home/home.dart';
import 'package:bike_route/home/widget/home_route_CUD_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('GraphQL Test')),
        body: const Column(
          children: [
            SizedBox(
              width: 300,
              height: 400,
              child: RouteListTest(),
            ),
            HomeRouteCudButton()
          ],
        ),
      ),
    );
  }
}
