import 'dart:async';

import 'package:bike_route/modules/gps/get_location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<MapGetLocation>(_onMapGetLocation);
  }

  FutureOr<void> _onMapGetLocation(MapGetLocation event, Emitter<MapState> emit) {
    Future<Position> position = getPosition();
  }
}
