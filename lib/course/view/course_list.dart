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
              title: Text(course.name ?? ''), // 이걸 모델에서 해주면 안되나? 기본값으로 빈 글자를 표시하고 싶은데
              subtitle: Text(course.ownerId ?? ''),
            );
          },
        );
      },
    );
  }
}
