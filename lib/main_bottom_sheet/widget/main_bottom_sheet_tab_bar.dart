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
                onTap: () => context
                    .read<MainBottomSheetBloc>()
                    .add(const MainBottomSheetPageChange(0)),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 70,
                    decoration: state.currentPage == 0 ? innerShadow() : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context
                    .read<MainBottomSheetBloc>()
                    .add(const MainBottomSheetPageChange(1)),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                  ),
                  child: Visibility(
                    child: Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 70,
                      decoration: state.currentPage == 1 ? innerShadow() : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context
                    .read<MainBottomSheetBloc>()
                    .add(const MainBottomSheetPageChange(2)),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 70,
                    decoration: state.currentPage == 2 ? innerShadow() : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context
                    .read<MainBottomSheetBloc>()
                    .add(const MainBottomSheetPageChange(3)),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 70,
                    decoration: state.currentPage == 3 ? innerShadow() : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration innerShadow() {
  return BoxDecoration(
    gradient: const LinearGradient(
        begin: Alignment(0.0, -20.0),
        end: Alignment(0.0, 3.5),
        colors: [
          Color(0xffD9D9D9),
          Color(0xffFFFFFF),
        ]),
    borderRadius: BorderRadius.circular(17.0),
    boxShadow: const [
      BoxShadow(
        offset: Offset(1, -5),
        blurStyle: BlurStyle.inner,
        color: Color(0xffD9D9D9),
        blurRadius: 10,
      ),
      BoxShadow(
        offset: Offset(-1, -4),
        blurStyle: BlurStyle.inner,
        color: Color(0xffD9D9D9),
        blurRadius: 10,
      ),
    ],
  );
}
