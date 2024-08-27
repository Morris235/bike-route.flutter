import 'package:bike_route/map/bloc/map_bloc.dart';
import 'package:bike_route/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class MapLoadingScreen extends StatelessWidget {
  const MapLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return FutureBuilder<bool>(
          future: state.permission,
          builder: (context, snapshot) {
            return Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                color: Color(0xffD9D9D9),
              ),
              child: 
              // snapshot.data != false
              true
                  ? const SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      child: AlertDialog(
                        title: const Text('위치정보 제공 동의'),
                        content: const Text('위치정보 제공 동의가 필요한 서비스입니다'),
                        actions: [
                          TextButton(
                            onPressed: () {
                          openAppSettings();
                            },
                            child: const Text('동의'),
                          ),
                        ],
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
