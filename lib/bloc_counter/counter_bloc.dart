import 'package:flutter_bloc/flutter_bloc.dart';

/// The events which `CounterBloc` will react to.
sealed class CounterEvent {}

/// Notifies bloc to increment state.
final class CounterIncrementPressed extends CounterEvent {}
final class CounteDecrementPressed extends CounterEvent {}

/// A `CounterBloc` which handles converting `CounterEvent`s into `int`s.
class CounterBloc extends Bloc<CounterEvent, int> {
  /// The initial state of the `CounterBloc` is 0.
  CounterBloc() : super(0) {
    /// When a `CounterIncrementPressed` event is added,
    /// the current `state` of the bloc is accessed via the `state` property
    /// and a new state is emitted via `emit`.
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounteDecrementPressed>((event, emit) => emit(state - 1));
  }
}