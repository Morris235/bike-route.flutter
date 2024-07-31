import 'package:bike_route/course/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CourseBloc>().add(const CourseListFetch());
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        return ListView.builder(
              itemCount: state.courses.length,
              itemBuilder: (context, index) {
                final course = state.courses[index];
                return ListTile(
                  title: Text(course.id),
                  subtitle: Row(
                    children: [
                      Text(course.name),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(course.ownerId),
                    ],
                  ),
                );
              },
            );
      },
    );
  }
}
