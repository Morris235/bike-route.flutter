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
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 25,
                ),
                child: SvgPicture.asset(
                  'assets/images/tab_bar/bike.svg',
                  width: 35.0,
                  height: 35.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 42,
                  top: 25,
                ),
                child: SvgPicture.asset(
                  'assets/images/tab_bar/course.svg',
                  width: 35.0,
                  height: 35.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 42,
                  top: 25,
                ),
                child: SvgPicture.asset(
                  'assets/images/tab_bar/ranking.svg',
                  width: 35.0,
                  height: 35.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 42,
                  top: 25,
                ),
                child: SvgPicture.asset(
                  'assets/images/tab_bar/profile.svg',
                  width: 35.0,
                  height: 35.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
