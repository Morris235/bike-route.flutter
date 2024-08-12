import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_bottom_sheet_event.dart';
part 'main_bottom_sheet_state.dart';

class MainBottomSheetBloc
    extends Bloc<MainBottomSheetEvent, MainBottomSheetState> {
  MainBottomSheetBloc() : super(const MainBottomSheetState()) {
    on<MainBottomSheetSizeChange>(_onMainBottomSheetSizeChange);
  }

  void _onMainBottomSheetSizeChange(
      MainBottomSheetSizeChange event, Emitter<MainBottomSheetState> emit) {
    const double min = 193.0;
    const double max = 800.0;
    final double currentPosition = event.currentPosition;
    final bool isExpanded = currentPosition < state.endPosition;
    final bool downDiff = (max - currentPosition) >= 180.0;
    final bool upDiff = (currentPosition - min) >= 65.0;

    emit(state.copyWith(position: currentPosition));

    if (isExpanded) {
      return emit(state.copyWith(size: downDiff ? min : currentPosition));
    } else if (currentPosition >= min) {
      return emit(state.copyWith(size: upDiff ? max : currentPosition));
    }
  }
}
