import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeAddRoute>(onAddRoute);
    on<HomeUpdateRoute>(onUpdateRoute);
    on<HomeDeleteRoute>(onDeleteRoute);
  }

  FutureOr<void> onAddRoute(HomeEvent event, Emitter<HomeState> emit) {
    
    emit(state.copyWith());
  }

  FutureOr<void> onUpdateRoute(HomeEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> onDeleteRoute(HomeEvent event, Emitter<HomeState> emit) {}
}
