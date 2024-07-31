import 'dart:async';

import 'package:bike_route/graphql_client.dart';
import 'package:bike_route/model/course.dart';
import 'package:bike_route/queries/course_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc()
      : super(
          CourseState(
            [
              Course(
                created: '',
                deleted: false,
                id: '',
                name: '',
                rate: 0,
                finishTime: '',
                ownerId: '',
              )
            ],
          ),
        ) {
    // on<HomeAddRoute>(onAddRoute);
    on<CourseUpdate>(onCourseUpdate);
    on<CourseDelete>(onCourseDelete);
    on<CourseListFetch>(onCourseListFetch);
  }

  FutureOr<void> onCourseListFetch(
      CourseListFetch event, Emitter<CourseState> emit) async {
    try {
      final result = await performQuery(findAllCourse, variables: {});
      final List<Course> courses = (result.data?['findAllCourse'] as List)
          .map((course) => Course.fromJson(course))
          .toList();
      emit(state.copyWith(courses));
    } catch (e) {
      // 로깅
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
