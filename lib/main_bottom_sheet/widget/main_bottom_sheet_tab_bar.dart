import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../main_bottom_sheet.dart';

class MainBottomSheetTabBar extends StatelessWidget {
  const MainBottomSheetTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBottomSheetBloc, MainBottomSheetState>(
      builder: (context, state) => Visibility(
        visible: state.isExpanded,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: const Color(0xffCDCDCD).withOpacity(0.45),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 18,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Visibility(
                        child: Container(
                          width: 70,
                          height: 67,
                          decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/tab_bar/bike.svg',
                            width: 35.0,
                            height: 35.0,
                          ),
                          const Text(
                            'Ride',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 42,
                    top: 18,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/tab_bar/course.svg',
                            width: 35.0,
                            height: 35.0,
                          ),
                          const Text(
                            'Course',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 42,
                    top: 18,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/tab_bar/ranking.svg',
                            width: 35.0,
                            height: 35.0,
                          ),
                          const Text(
                            'Ranking',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 42,
                    right: 10,
                    top: 18,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/tab_bar/profile.svg',
                            width: 35.0,
                            height: 35.0,
                          ),
                          const Text(
                            'Profile',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
