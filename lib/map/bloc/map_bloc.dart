import 'dart:async';

import 'package:bike_route/modules/gps/get_location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<MapGetLocation>(_onMapGetLocation);
    on<MapGetPermission>(_onMapGetPermission);
    add(const MapGetPermission());
    add(const MapGetLocation());
  }

  final MapController mapController = MapController();

  FutureOr<void> _onMapGetLocation(
      MapGetLocation event, Emitter<MapState> emit) async {
    Future<Position> position = getPosition();
    emit(state.copyWith(position: position));
  }

  FutureOr<void> _onMapGetPermission(
      MapGetPermission event, Emitter<MapState> emit) async {
    final Future<PermissionStatus> permission = Permission.location.request();
    if (await permission.isGranted) {
      emit(state.copyWith(permission: permission.isGranted));
    } else if (await permission.isDenied ||
        await permission.isPermanentlyDenied) {
      emit(state.copyWith(permission: permission.isDenied));
    }
  }

  @override
  Future<void> close() {
    mapController.dispose();
    return super.close();
  }
}
