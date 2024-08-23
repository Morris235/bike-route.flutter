part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState({this.permission, this.position});

  final Future<bool>? permission;
  final Future<Position>? position;

  @override
  List<Object?> get props => [permission, position];

  MapState copyWith({
    Future<bool>? permission,
    Future<Position>? position,
  }) {
    return MapState(
      permission: permission ?? this.permission,
      position: position ?? this.position,
    );
  }
}
