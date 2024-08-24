import 'package:bike_route/map/bloc/map_bloc.dart';
import 'package:bike_route/map/view/map_loading_screen.dart';
import 'package:bike_route/utils/logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../../main_bottom_sheet/main_bottom_sheet.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc(),
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFF333333),
            body: SafeArea(
              bottom: false,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                   FutureBuilder<Position>(
                    future: state.position,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const MapLoadingScreen();
                      } else if (snapshot.hasError) {
                        logger.warning(snapshot.error.toString());
                      } else if (snapshot.hasData) {
                        final Position position = snapshot.data!;
                        return FlutterMap(
                          mapController: context.read<MapBloc>().mapController,
                          options: MapOptions(
                            initialCenter: LatLng(
                              position.latitude,
                              position.longitude,
                            ),
                            initialZoom: 18,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.bike_route.app',
                            ),
                          ],
                        );
                      }
                      return const MapLoadingScreen();
                    },
                  ),
                  const MainBottomSheetPage(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}