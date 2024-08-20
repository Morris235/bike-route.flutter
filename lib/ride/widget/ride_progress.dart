import 'package:bike_route/ride/bloc/ride_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RideProgress extends StatelessWidget {
  const RideProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideBloc, RideState>(
      builder: (context, state) {
        return SizedBox(
          width: 300,
          height: 300,
          child: Transform.rotate(
            angle: -3.14,
            child: const CircularProgressIndicator(
              value: .8,
              strokeWidth: 8,
              color: Color(0xff58C038),
            ),
          ),
        );
      },
    );
  }
}