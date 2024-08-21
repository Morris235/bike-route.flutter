part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState({
    this.value = '',
  });

  final String value;

  @override
  List<Object> get props => [value];

  MapState copyWith({
    String? value,
  }) {
    return MapState(
      value: value ?? this.value,
    );
  }
}
