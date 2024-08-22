import 'package:bike_route/map/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: const SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
