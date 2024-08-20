import 'package:bike_route/ride/bloc/ride_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RideSummary extends StatelessWidget {
  const RideSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideBloc, RideState>(
      builder: (context, state) {
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
      },
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