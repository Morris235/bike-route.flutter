part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent(this.id, this.name, this.rate, this.finishTime, this.ownerId, this.created, this.deleted);

  final String id;
  final String name;
  final int rate;
  final String finishTime;
  final String ownerId;
  final String created;
  final bool deleted;
}

class HomeAddRoute extends HomeEvent {
  const HomeAddRoute(super.id, super.name, super.rate, super.finishTime, super.ownerId, super.created, super.deleted);

  @override
  List<Object> get props =>
      [id, name, rate, finishTime, ownerId, created, deleted];
}

class HomeUpdateRoute extends HomeEvent {
  const HomeUpdateRoute(super.id, super.name, super.rate, super.finishTime, super.ownerId, super.created, super.deleted);

  @override
  List<Object> get props =>
      [id, name, rate, finishTime, ownerId, created, deleted];
}

class HomeDeleteRoute extends HomeEvent {
  const HomeDeleteRoute(super.id, super.name, super.rate, super.finishTime, super.ownerId, super.created, super.deleted);

  @override
  List<Object> get props =>
      [id, name, rate, finishTime, ownerId, created, deleted];
}
