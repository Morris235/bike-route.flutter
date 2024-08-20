import 'package:bike_route/ride/bloc/ride_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RideSpeedInfo extends StatelessWidget {
  const RideSpeedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideBloc, RideState>(
      builder: (context, state) {
        return const SizedBox(
          width: 300,
          height: 291,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '23.9',
                style: TextStyle(
                  fontSize: 60,
                ),
              ),
              Text(
                'KM / H',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}