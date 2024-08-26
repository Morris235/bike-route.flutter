part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class MapGetPermission extends MapEvent {
  const MapGetPermission({this.permission = false});

  final bool permission;

  @override
  List<Object> get props => [permission];
}

class MapGetLocation extends MapEvent {
  const MapGetLocation();

  @override
  List<Object> get props => [];
}

class MapGetCurrentLocation extends MapEvent {
  const MapGetCurrentLocation();

    @override
  List<Object> get props => [];
}