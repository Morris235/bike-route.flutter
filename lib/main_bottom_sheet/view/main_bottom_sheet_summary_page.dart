import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainBottomSheetSummaryPage extends StatelessWidget {
  const MainBottomSheetSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 35,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text('daily'),
            ),
            const Column(
              children: [
                Text(
                  '23',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'km / h',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Column(
                children: [
                  const Text(
                    '200',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/bottomsheet/heart.svg',
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: LinearProgressIndicator(
            value: 0.3,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  Text(
                    '100',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'km',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  '5 hr 02 min',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Drive',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 24),
              child: Column(
                children: [
                  Text(
                    '16:31',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Arrival',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
