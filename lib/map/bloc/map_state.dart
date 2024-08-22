part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState(this.position);

  final Future<Position>? position;

  @override
  List<Object?> get props => [position];

  MapState copyWith({
    Future<Position>? position,
  }) {
    return MapState(
      position ?? this.position,
    );
  }
}
