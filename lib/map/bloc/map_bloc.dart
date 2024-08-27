import 'dart:async';
import 'dart:io';

import 'package:bike_route/utils/logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<MapGetLocation>(_onMapGetLocation);
    on<MapGetPermission>(_onMapGetPermission);
    on<MapGetCurrentLocation>(_onMapGetCurrentLocation);
    add(const MapGetPermission());
    add(const MapGetLocation());
  }

  final MapController mapController = MapController();

  void _onMapGetLocation(MapGetLocation event, Emitter<MapState> emit) async {
    try {
      final Future<Position> position = (Platform.isIOS
          ? Geolocator.getCurrentPosition(
              locationSettings: AppleSettings(
                  accuracy: LocationAccuracy.high,
                  activityType: ActivityType.fitness,
                  distanceFilter: 100,
                  pauseLocationUpdatesAutomatically: true,
                  showBackgroundLocationIndicator: false),
            )
          : Geolocator.getCurrentPosition(
              locationSettings: AndroidSettings(
                accuracy: LocationAccuracy.high,
                distanceFilter: 100,
                forceLocationManager: true,
                intervalDuration: const Duration(seconds: 10),
                foregroundNotificationConfig:
                    const ForegroundNotificationConfig(
                  notificationText:
                      "Example app will continue to receive your location even when you aren't using it",
                  notificationTitle: "Running in Background",
                  enableWakeLock: true,
                ),
              ),
            ));
      emit(state.copyWith(position: position));
    } catch (e) {
      logger.severe(e);
    }
  }

  FutureOr<void> _onMapGetPermission(
      MapGetPermission event, Emitter<MapState> emit) async {
    try {
      final Future<PermissionStatus> permission = Permission.location.request();
      if (await permission.isGranted) {
        emit(state.copyWith(permission: permission.isGranted));
      } else if (await permission.isDenied ||
          await permission.isPermanentlyDenied) {
        emit(state.copyWith(permission: permission.isDenied));
      }
    } catch (e) {
      logger.severe(e);
    }
  }

  FutureOr<void> _onMapGetCurrentLocation(
      MapGetCurrentLocation event, Emitter<MapState> emit) async {
    try {
      add(const MapGetLocation());
      Position? location = await state.position;
      if (location == null) return;
      mapController.move(LatLng(location.latitude, location.longitude), 18.0);
    } catch (e) {
      logger.severe(e);
    }
  }

  @override
  Future<void> close() {
    mapController.dispose();
    return super.close();
  }
}
