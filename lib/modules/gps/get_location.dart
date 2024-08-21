import 'dart:io';

import 'package:bike_route/utils/logging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logging/logging.dart';

Future<Position> getPosition() async {
  Position position;
  if (Platform.isIOS) {
    position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings());
  } else {
    position =
        await Geolocator.getCurrentPosition(locationSettings: AppleSettings());
  }
  getPosition()
      .then(
        (value) => logger.warning('Error get location ${value.longitude}'),
      )
      .onError(
        (error, stackTrace) => logger.log(Level.WARNING, stackTrace),
      );
  return position;
}
