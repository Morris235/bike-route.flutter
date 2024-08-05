import 'package:bike_route/course/course.dart';
import 'package:bike_route/queries/course_queries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
          // Mutation(
          //   options: MutationOptions(document: gql(createCourse)),
          //   builder: (RunMutation runMutation, QueryResult? result) {
          //     return ElevatedButton(
          //       onPressed: () {
          //         runMutation(
          //           {
          //             'id': '5r',
          //             'name': 'up down hill',
          //             'rate': 10,
          //             'owner_id': 'chris',
          //           },
          //         );
          //       },
          //       child: const Text('Add course'),
          //     );
          //   },
          // ),
          Mutation(
            options: MutationOptions(document: gql(updateCourse)),
            builder: (RunMutation runMutation, QueryResult? result) {
              return ElevatedButton(
                onPressed: () {
                  runMutation(
                    {
                      'id': '1r',
                      'name': 'down hill',
                      'rate': 7,
                      'owner_id': 'jim'
                    },
                  );
                },
                child: const Text('update course'),
              );
            },
          ),
          Mutation(
            options: MutationOptions(document: gql(deleteCourseById)),
            builder: (RunMutation runMutation, QueryResult? result) {
              return ElevatedButton(
                onPressed: () {
                  runMutation({'id': '2r'});
                },
                child: const Text('delete course'),
              );
            },
          ),
        ],
      ),
    );
  }
}
