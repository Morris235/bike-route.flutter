import 'package:bike_route/course/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseEventButtons extends StatelessWidget {
  const CourseEventButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) => Column(
        children: [
          ElevatedButton(
            onPressed: () => context.read<CourseBloc>().add(const CourseCreate()),
            child: const Text('mutation add course test'),
          ),
        ],
      ),
    );
  }
}
