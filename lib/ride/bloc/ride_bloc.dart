import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'ride_event.dart';
part 'ride_state.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  RideBloc() : super(const RideState()) {
    on<RideEvent>((event, emit) {
// TODO: implement event handler
    });
  }
}
