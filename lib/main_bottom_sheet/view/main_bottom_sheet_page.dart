import 'package:bike_route/main_bottom_sheet/main_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainBottomSheetPage extends StatelessWidget {
  const MainBottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBottomSheetBloc(),
      child: BlocBuilder<MainBottomSheetBloc, MainBottomSheetState>(
        builder: (context, state) => AnimatedContainer(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Color(0xFFFFFFFF),
                strokeAlign: BorderSide.strokeAlignOutside,
                width: 3,
              ),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          height: state.size,
          duration: const Duration(milliseconds: 150),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: state.isExpanded,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 15,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/bottomsheet/back_arrow.svg',
                        width: 25.0,
                        height: 25.0,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: state.isExpanded,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/bottomsheet/home.svg',
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onPanUpdate: (details) {
                      final double position =
                          MediaQuery.of(context).size.height -
                              details.globalPosition.dy;
                      return context
                          .read<MainBottomSheetBloc>()
                          .add(MainBottomSheetSizeChange(position));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: state.isExpanded ? 0 : 15),
                      alignment: Alignment.topCenter,
                      width: 200,
                      height: state.gestureAbleSize,
                      child: SvgPicture.asset(
                        'assets/images/bottomsheet/line.svg',
                        width: 40.0,
                        height: 5.0,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: state.isExpanded,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                        top: 15,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/bottomsheet/like_button_dummy.svg',
                        width: 80.0,
                        height: 40.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
