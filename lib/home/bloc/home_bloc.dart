import 'dart:async';

import 'package:bike_route/queries/route_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeAddRoute>(onAddRoute);
    on<HomeUpdateRoute>(onUpdateRoute);
    on<HomeDeleteRoute>(onDeleteRoute);
  }

  void onAddRoute(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(id: event.id));
    try {
      final MutationOptions options = MutationOptions(
        document: gql(createRoute),
        variables: const <String, dynamic>{
          'id': '4r',
          'name': 'up down hill',
          'rate': 10,
          'owner_id': 'chris',
        },
      );
      // final QueryResult result = await 
    } catch (e) {}
  }

  FutureOr<void> onUpdateRoute(HomeEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> onDeleteRoute(HomeEvent event, Emitter<HomeState> emit) {}
}
