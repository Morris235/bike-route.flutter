import 'package:bike_route/map/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class MapLoadingScreen extends StatelessWidget {
  const MapLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return Container(
            alignment: Alignment.center,
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xffD9D9D9),
            ),
            child: state.permission != null
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
                            context.read<MapBloc>().add(const MapGetPermission());
                          },
                          child: const Text('동의'),
                        ),
                      ],
                    ),
                ));
      },
    );
  }
}
