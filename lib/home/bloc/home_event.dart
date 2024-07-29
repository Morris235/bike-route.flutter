part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeSomeThingEvent extends HomeEvent {
  const HomeSomeThingEvent(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}
