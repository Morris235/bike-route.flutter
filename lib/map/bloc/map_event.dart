part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class NavigationSomeThingEvent extends MapEvent {
  const NavigationSomeThingEvent(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}
