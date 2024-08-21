part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class MapGetLocation extends MapEvent {
  const MapGetLocation(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}
