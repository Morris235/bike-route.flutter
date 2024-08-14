import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main_bottom_sheet.dart';

class MainBottomSheetMenu extends StatelessWidget {
  const MainBottomSheetMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBottomSheetBloc, MainBottomSheetState>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
      ),
    );
  }
}
