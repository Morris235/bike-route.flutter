part of 'course_bloc.dart';

class CourseState extends Equatable {
  const CourseState(this.courses);

  final List<Course> courses;

  @override
  List<Object> get props => [courses];

  CourseState copyWith(List<Course>? courses) {
    return CourseState(courses ?? this.courses);
  }
}
