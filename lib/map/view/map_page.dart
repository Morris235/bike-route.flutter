import 'package:bike_route/main_bottom_sheet/view/main_bottom_sheet_page.dart';
import 'package:bike_route/map/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFF333333),
        body: SafeArea(
          bottom: false,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              FlutterMap(
                options: const MapOptions(),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.bike_route.app',
                  ),
                ],
              ),
              const MainBottomSheetPage(),
            ],
          ),
        ),
      ),
    );
  }
}
