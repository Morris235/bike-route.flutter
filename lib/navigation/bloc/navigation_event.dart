part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class NavigationSomeThingEvent extends NavigationEvent {
  const NavigationSomeThingEvent(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}
