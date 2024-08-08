part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  const NavigationState({
    this.value = '',
  });

  final String value;

  @override
  List<Object> get props => [value];

  NavigationState copyWith({
    String? value,
  }) {
    return NavigationState(
      value: value ?? this.value,
    );
  }
}
