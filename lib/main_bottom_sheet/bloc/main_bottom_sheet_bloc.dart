import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_bottom_sheet_event.dart';
part 'main_bottom_sheet_state.dart';

class MainBottomSheetBloc
    extends Bloc<MainBottomSheetEvent, MainBottomSheetState> {
  MainBottomSheetBloc() : super(const MainBottomSheetState()) {
    on<MainBottomSheetSizeChange>(_onMainBottomSheetSizeChange);
    on<MainBottomSheetPageChange>(_onMainBottomSheetPageChange);
  }

  final PageController pageController = PageController();

  void _onMainBottomSheetSizeChange(
      MainBottomSheetSizeChange event, Emitter<MainBottomSheetState> emit) {
    const double min = 193.0;
    const double max = 800.0;
    final double currentPosition = event.currentPosition;
    final bool isCurrentExpanded = currentPosition < state.endPosition;
    final bool downDiff = (max - currentPosition) >= 170.0;
    final bool upDiff = (currentPosition - min) >= 65.0;

    emit(state.copyWith(endPosition: currentPosition));

    if (isCurrentExpanded) {
      return emit(state.copyWith(size: downDiff ? min : currentPosition));
    } else if (currentPosition >= min) {
      return emit(state.copyWith(size: upDiff ? max : currentPosition));
    }
  }

  FutureOr<void> _onMainBottomSheetPageChange(
      MainBottomSheetPageChange event, Emitter<MainBottomSheetState> emit) {
    emit(state.copyWith(currentPage: event.currentPage));
    pageController.animateToPage(event.currentPage,
        duration: const Duration(microseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
