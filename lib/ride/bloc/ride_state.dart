part of 'ride_bloc.dart';

class RideState extends Equatable {
  const RideState({
    this.value = '',
  });

  final String value;

  @override
  List<Object> get props => [value];

  RideState copyWith({
    String? value,
  }) {
    return RideState(
      value: value ?? this.value,
    );
  }
}
