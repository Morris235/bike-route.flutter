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
    on<CourseCreate>(_onAddRoute);
    on<CourseUpdate>(_onCourseUpdate);
    on<CourseDelete>(_onCourseDelete);
    on<CourseListFetch>(_onCourseListFetch);
    add(const CourseListFetch());
  }

  FutureOr<void> _onCourseListFetch(
      CourseListFetch event, Emitter<CourseState> emit) async {
    try {
      final QueryResult<Object?> result = await performQuery(
          findAllCourse(
              id: true,
              rate: true,
              name: true,
              ownerId: true,
              created: true,
              deleted: true),
          variables: {});

      if (result.data == null || result.data?['findAllCourse'] == null) {
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

  void _onAddRoute(CourseCreate event, Emitter<CourseState> emit) async {
    try {
      final QueryResult<Object?> result = await performMutation(
        createCourse,
        variables: const <String, dynamic>{
          'id': '',
          'name': 'up hill',
          'rate': 12,
          'owner_id': 'yorris',
        },
      );

      if (result.data == null || result.data?['createCourse'] == null) {
        logger.warning('No Data found for findAllCourse query');
        return;
      }

      final Map<String, dynamic> data = result.data!['createCourse'];
      final Course course = Course.fromJson(data);
      final List<Course> updateCourses = List.from(state.courses)..add(course);

      emit(state.copyWith(updateCourses));
    } catch (e) {
      logger.severe(
          'Query Call Exception ${e.toString()}', e, StackTrace.current);
    }
  }

  FutureOr<void> _onCourseUpdate(
      CourseEvent event, Emitter<CourseState> emit) {}

  FutureOr<void> _onCourseDelete(
      CourseDelete event, Emitter<CourseState> emit) async {
    try {
      final QueryResult<Object?> result =
          await performMutation(deleteCourseById, variables: {'id': event.id});

      if (result.data!['deleteCourseById'] == false) {
        logger.warning('course delete false : ${event.id}');
        return;
      }
      final List<Course> updateCourses = List.from(state.courses)
        ..removeWhere((element) => element.id == event.id);
      emit(state.copyWith(updateCourses));
    } catch (e) {
      logger.severe(
          'Query Call Exception ${e.toString()}', e, StackTrace.current);
    }
  }
}
