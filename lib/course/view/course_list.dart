import 'package:bike_route/course/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.courses.length,
          itemBuilder: (context, index) {
            final course = state.courses[index];
            return ListTile(
              title: Text(course.name ?? ''),
              subtitle: Row(
                children: [
                  Text(course.rate.toString()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(course.ownerId ?? ''),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(course.created ?? ''),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CourseBloc>().add(CourseDelete(course.id!));
                    },
                    child: const Text("삭제"),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
