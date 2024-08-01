import 'dart:async';

import 'package:bike_route/graphql_client.dart';
import 'package:bike_route/utils/logging.dart';
import 'package:bike_route/model/course.dart';
import 'package:bike_route/queries/course_queries.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(const CourseState([])) {
    // on<HomeAddRoute>(onAddRoute);
    on<CourseUpdate>(onCourseUpdate);
    on<CourseDelete>(onCourseDelete);
    on<CourseListFetch>(onCourseListFetch);
    add(const CourseListFetch());
  }

  FutureOr<void> onCourseListFetch(
      CourseListFetch event, Emitter<CourseState> emit) async {
    try {
      final result = await performQuery(findAllCourse, variables: {});
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

  // void onAddRoute(HomeEvent event, Emitter<HomeState> emit) async {
  //   emit(state.copyWith(id: event.id));
  //   try {
  //     final MutationOptions options = MutationOptions(
  //       document: gql(createRoute),
  //       variables: const <String, dynamic>{
  //         'id': '4r',
  //         'name': 'up down hill',
  //         'rate': 10,
  //         'owner_id': 'chris',
  //       },
  //     );
  //     // final QueryResult result = await
  //   } catch (e) {}
  // }

  FutureOr<void> onCourseUpdate(CourseEvent event, Emitter<CourseState> emit) {}

  FutureOr<void> onCourseDelete(CourseEvent event, Emitter<CourseState> emit) {}
}
