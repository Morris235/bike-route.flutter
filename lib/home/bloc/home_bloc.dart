import 'dart:async';

import 'package:bike_route/graphql_client.dart';
import 'package:bike_route/model/route.dart';
import 'package:bike_route/queries/route_query.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    // on<HomeAddRoute>(onAddRoute);
    on<HomeUpdateRoute>(onUpdateRoute);
    on<HomeDeleteRoute>(onDeleteRoute);
    on<HoemFetchRoutes>(onFetchRoutes);
  }

  FutureOr<void> onFetchRoutes(
      HoemFetchRoutes event, Emitter<HomeState> emit) async {
    try {
      final result = await performQuery(findAllRoute, variables: {});
      emit(result.data?['findAllRoutes']);
    } catch (e) {
      // 로깅
    }
  }

  // void onAddRoute(HomeEvent event, Emitter<HomeState> emit) async {
  //   emit(state.copyWith(id: event.id));
  //   try {
  //     final MutationOptions options = MutationOptions(
  //       document: gql(createRoute),
  //       variables: const <String, dynamic>{
  //         'id': '4r',
  //         'name': 'up down hill',
  //         'rate': 10,
  //         'owner_id': 'chris',
  //       },
  //     );
  //     // final QueryResult result = await
  //   } catch (e) {}
  // }

  FutureOr<void> onUpdateRoute(HomeEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> onDeleteRoute(HomeEvent event, Emitter<HomeState> emit) {}
}
