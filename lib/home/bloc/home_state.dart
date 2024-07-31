part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState(this.courses);

  final List<Course> courses;

  @override
  List<Object> get props => [courses];

  HomeState copyWith(List<Course>? courses) {
    return HomeState(courses ?? this.courses);
  }
}
