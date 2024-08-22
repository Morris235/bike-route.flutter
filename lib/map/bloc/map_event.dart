part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class MapGetPermission extends MapEvent {
  const MapGetPermission();

  @override
  List<Object> get props => [];
}

class MapGetLocation extends MapEvent {
  const MapGetLocation(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}
