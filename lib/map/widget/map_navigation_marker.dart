import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class MapNavigationMarker extends StatelessWidget {
  const MapNavigationMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return CurrentLocationLayer(
      alignPositionOnUpdate: AlignOnUpdate.always,
      alignDirectionOnUpdate: AlignOnUpdate.always,
      style: const LocationMarkerStyle(
        marker: DefaultLocationMarker(
          color: Colors.white,
          child: Icon(Icons.navigation),
        ),
        markerSize: Size(35, 35),
        markerDirection: MarkerDirection.heading,
      ),
    );
  }
}
