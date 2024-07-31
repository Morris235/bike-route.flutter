import 'package:bike_route/course/course.dart';
import 'package:bike_route/course/widget/course_event_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('GraphQL Test')),
        body: const Column(
          children: [
            SizedBox(
              width: 300,
              height: 400,
              child: CourseList(),
            ),
            CourseEventButtons()
          ],
        ),
      ),
    );
  }
}
