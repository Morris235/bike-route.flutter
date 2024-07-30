part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HoemFetchRoutes extends HomeEvent {
  const HoemFetchRoutes();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeAddRoute extends HomeEvent {
  const HomeAddRoute(this.id, this.name, this.rate, this.finishTime,
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

class HomeUpdateRoute extends HomeEvent {
  const HomeUpdateRoute(this.id, this.name, this.rate, this.finishTime,
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

class HomeDeleteRoute extends HomeEvent {
  const HomeDeleteRoute(this.id);

  final String id;
  @override
  List<Object> get props => [id];
}
