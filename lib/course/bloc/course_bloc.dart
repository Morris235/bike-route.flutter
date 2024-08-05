import 'dart:async';

import 'package:bike_route/graphql_client.dart';
import 'package:bike_route/utils/logging.dart';
import 'package:bike_route/model/course.dart';
import 'package:bike_route/queries/course_queries.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(const CourseState([])) {
    on<CourseCreate>(onAddRoute);
    on<CourseUpdate>(onCourseUpdate);
    on<CourseDelete>(onCourseDelete);
    on<CourseListFetch>(onCourseListFetch);
    add(const CourseListFetch());
  }

  FutureOr<void> onCourseListFetch(
      CourseListFetch event, Emitter<CourseState> emit) async {
    try {
      final QueryResult<Object?> result = await performQuery(
          findAllCourse(id: true, name: true, ownerId: true),
          variables: {});
      if (result.data == null || result.data!['findAllCourse'] == null) {
        logger.warning('No Data found for findAllCourse query');
        emit(state.copyWith([]));
        return;
      }

      final List<dynamic> data = result.data!['findAllCourse'];
      final List<Course> courses = data
          .where((item) => item != null)
          .map((course) {
            try {
              return Course.fromJson(course as Map<String, dynamic>);
            } catch (e) {
              logger.warning('Error parsing course data: ${e.toString()}');
              return null;
            }
          })
          .whereType<Course>()
          .toList();

      emit(state.copyWith(courses));
    } catch (e) {
      logger.severe(
          'Query Call Exception ${e.toString()}', e, StackTrace.current);
    }
  }

  void onAddRoute(CourseEvent event, Emitter<CourseState> emit) async {
    try {
      final QueryResult<Object?> result = await performMutation(
        createCourse,
        variables: const <String, dynamic>{
          'id': '114r',
          'name': 'down hill',
          'rate': 13,
          'owner_id': 'cho',
        },
      );

      final Map<String, dynamic> data = result.data!['createCourse'];
      Course course = Course.fromJson(data);
      final List<Course> courses = state.courses;
      courses.add(course);

      emit(state.copyWith(courses));
    } catch (e) {
      logger.severe(
          'Query Call Exception ${e.toString()}', e, StackTrace.current);
    }
  }

  FutureOr<void> onCourseUpdate(CourseEvent event, Emitter<CourseState> emit) {}

  FutureOr<void> onCourseDelete(CourseEvent event, Emitter<CourseState> emit) {}
}
