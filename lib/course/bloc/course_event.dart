part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();
}

class CourseListFetch extends CourseEvent {
  const CourseListFetch();

  @override
  List<Object> get props => [];
}

class CourseCreate extends CourseEvent {
  const CourseCreate(this.id, this.name, this.rate, this.finishTime,
      this.ownerId, this.created, this.deleted);

  final String id;
  final String name;
  final int rate;
  final String finishTime;
  final String ownerId;
  final String created;
  final bool deleted;

  @override
  List<Object> get props =>
      [id, name, rate, finishTime, ownerId, created, deleted];
}

class CourseUpdate extends CourseEvent {
  const CourseUpdate(this.id, this.name, this.rate, this.finishTime,
      this.ownerId, this.created, this.deleted);

  final String id;
  final String name;
  final int rate;
  final String finishTime;
  final String ownerId;
  final String created;
  final bool deleted;

  @override
  List<Object> get props =>
      [id, name, rate, finishTime, ownerId, created, deleted];
}

class CourseDelete extends CourseEvent {
  const CourseDelete(this.id);

  final String id;
  @override
  List<Object> get props => [id];
}
