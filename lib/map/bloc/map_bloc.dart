import 'dart:async';

import 'package:bike_route/modules/gps/get_location.dart';
import 'package:bike_route/modules/gps/permission.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<MapGetLocation>(_onMapGetLocation);
    on<MapGetPermission>(_onMapGetPermission);
    add(const MapGetPermission());
  }

  FutureOr<void> _onMapGetLocation(MapGetLocation event, Emitter<MapState> emit) {
    permission();
    Future<Position> position = getPosition();
  }

  FutureOr<void> _onMapGetPermission(MapGetPermission event, Emitter<MapState> emit) {
    permission();
  }
}
