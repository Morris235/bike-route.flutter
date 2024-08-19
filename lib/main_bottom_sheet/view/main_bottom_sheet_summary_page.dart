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
          height: 20,
        ),
        SizedBox(
          width: double.maxFinite,
          height: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 24,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Transform.rotate(
                        angle: -3.14,
                        child: const CircularProgressIndicator(
                          value: 0.45,
                          strokeWidth: 2,
                          color: Color(0xff58C038),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '120',
                          style: TextStyle(fontSize: 15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 3,
                              child: Divider(
                                indent: 15,
                                endIndent: 0,
                                thickness: 2,
                                color: const Color(0xff111111).withOpacity(0.3),
                              ),
                            ),
                            const SizedBox(width: 2,),
                            const Text('km' , style: TextStyle(fontSize: 8),)
                          ],
                        ),
                        const Text(
                          '300',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width / 2.22,
                child: const Column(
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
              ),
              Positioned(
                right: 24,
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
        ),
        const SizedBox(
          height: 14,
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  const Text(
                    '120',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'km',
                    style: TextStyle(
                        fontSize: 12,
                        color: const Color(0xff111111).withOpacity(0.4)),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Text(
                  '5 hr 02 min',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Drive',
                  style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xff111111).withOpacity(0.4)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Column(
                children: [
                  const Text(
                    '16:31',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Arrival',
                    style: TextStyle(
                        fontSize: 12,
                        color: const Color(0xff111111).withOpacity(0.4)),
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
