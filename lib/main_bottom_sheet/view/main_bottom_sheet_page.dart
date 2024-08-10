import 'package:bike_route/main_bottom_sheet/main_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBottomSheetPage extends StatelessWidget {
  const MainBottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBottomSheetBloc(),
      child: BlocBuilder<MainBottomSheetBloc, MainBottomSheetState>(
        builder: (context, state) => GestureDetector(
          onVerticalDragUpdate: (details) {
            final double position =
                MediaQuery.of(context).size.height - details.globalPosition.dy;
            return context
                .read<MainBottomSheetBloc>()
                .add(MainBottomSheetSizeChange(position));
          },
          onVerticalDragEnd: (details) {
            final double position =
                MediaQuery.of(context).size.height - details.globalPosition.dy;
            return context
                .read<MainBottomSheetBloc>()
                .add(MainBottomSheetSizeChange(position));
          },
          child: AnimatedContainer(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            height: state.size,
            duration: const Duration(milliseconds: 10),
            child: const Center(
              child: Text('바텀시트'),
            ),
          ),
        ),
      ),
    );
  }
}