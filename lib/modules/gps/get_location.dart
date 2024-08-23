import 'dart:io';

import 'package:geolocator/geolocator.dart';

Future<Position> getPosition() async {
  Position position;
  if (Platform.isIOS) {
    position = await Geolocator.getCurrentPosition(
        locationSettings: AppleSettings(
            accuracy: LocationAccuracy.high,
            activityType: ActivityType.fitness,
            distanceFilter: 100,
            pauseLocationUpdatesAutomatically: true,
            showBackgroundLocationIndicator: false));
  } else {
    position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 100,
            forceLocationManager: true,
            intervalDuration: const Duration(seconds: 10),
            foregroundNotificationConfig: const ForegroundNotificationConfig(
              notificationText:
                  "Example app will continue to receive your location even when you aren't using it",
              notificationTitle: "Running in Background",
              enableWakeLock: true,
            )));
  }
  return position;
}
