import 'package:bike_route/course/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: CourseList(),
            ),
            CourseEventButtons()
          ],
        ),
      ),
    );
  }
}
