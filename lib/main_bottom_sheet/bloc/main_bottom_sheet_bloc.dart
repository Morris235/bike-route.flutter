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
    final bool isExpanded = event.currentPosition < state.endPosition;

    emit(state.copyWith(position: event.currentPosition));

    if (isExpanded) {
      return emit(state.copyWith(size: min));
    } else {
      return emit(state.copyWith(size: max));
    }
  }
}
