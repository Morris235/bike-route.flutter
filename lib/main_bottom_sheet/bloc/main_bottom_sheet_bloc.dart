import 'package:bike_route/utils/logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

part 'main_bottom_sheet_event.dart';
part 'main_bottom_sheet_state.dart';

class MainBottomSheetBloc
    extends Bloc<MainBottomSheetEvent, MainBottomSheetState> {
  MainBottomSheetBloc() : super(const MainBottomSheetState()) {
    on<MainBottomSheetSizeChange>(_onMainBottomSheetSizeChange);
    on<MainBottomSheetDragCancel>(_onMainBottomSheetDragCancel);
  }

  void _onMainBottomSheetSizeChange(
      MainBottomSheetSizeChange event, Emitter<MainBottomSheetState> emit) {
    const double min = 193.0;
    const double max = 803.0;
    const double autoExpandSize = 240.0;
    const double autoReduceSize = 650.0;

    if (event.size >= min && event.size <= max) {
      emit(state.copyWith(size: event.size));
    }
    if (event.size >= autoExpandSize) {
      emit(state.copyWith(size: max));
    }
  }

  void _onMainBottomSheetDragCancel(
      MainBottomSheetDragCancel event, Emitter<MainBottomSheetState> emit) {}
}
