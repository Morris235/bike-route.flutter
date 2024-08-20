import 'package:bike_route/ride/ride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RidePage extends StatelessWidget {
  const RidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RideBloc(),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const SpeedInfo(),
              RideProgress(),
              const RideSummary(),
            ],
          ),
        ),
      ),
    );
  }
}
