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
              const _SpeedInfo(),
              _RotatedProgressIndicator(),
              const _RideSummary(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpeedInfo extends StatelessWidget {
  const _SpeedInfo({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}

class _RotatedProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  }
}

class _RideSummary extends StatelessWidget {
  const _RideSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 30,
      bottom: 30,
      child: SizedBox(
        width: 330,
        height: 185,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _RideSummaryRow(
              leftText: '20.3 KM / H',
              leftLabel: 'AVG',
              rightText: '28.3 KM / H',
              rightLabel: 'MAX',
            ),
            _RideSummaryRow(
              leftText: '120.3 KM / H',
              leftLabel: 'TOTAL',
              rightText: '05 hr 02 min',
              rightLabel: 'TIME',
            ),
          ],
        ),
      ),
    );
  }
}

class _RideSummaryRow extends StatelessWidget {
  final String leftText;
  final String leftLabel;
  final String rightText;
  final String rightLabel;

  const _RideSummaryRow({
    required this.leftText,
    required this.leftLabel,
    required this.rightText,
    required this.rightLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _RideSummaryColumn(text: leftText, label: leftLabel),
        const SizedBox(width: 30),
        _RideSummaryColumn(text: rightText, label: rightLabel),
      ],
    );
  }
}

class _RideSummaryColumn extends StatelessWidget {
  final String text;
  final String label;

  const _RideSummaryColumn({
    required this.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
