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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 13,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanUpdate: (details) {
                  final double position = MediaQuery.of(context).size.height -
                      details.globalPosition.dy;
                  return context
                      .read<MainBottomSheetBloc>()
                      .add(MainBottomSheetSizeChange(position));
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  width: double.maxFinite,
                  height: state.gestureAbleSize,
                  child: SvgPicture.asset(
                      'assets/images/bottomsheet/line.svg',
                      width: 30.0,
                      height: 5.0,
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
