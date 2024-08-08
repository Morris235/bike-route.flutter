import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_bottom_sheet_event.dart';
part 'main_bottom_sheet_state.dart';

class MainBottomSheetBloc
    extends Bloc<MainBottomSheetEvent, MainBottomSheetState> {
  MainBottomSheetBloc() : super(const MainBottomSheetState()) {
    on<MainBottomSheetEvent>((event, emit) {
// TODO: implement event handler
    });
  }
}
