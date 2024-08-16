part of 'main_bottom_sheet_bloc.dart';

abstract class MainBottomSheetEvent extends Equatable {
  const MainBottomSheetEvent();
}

class MainBottomSheetSizeChange extends MainBottomSheetEvent {
  const MainBottomSheetSizeChange(this.currentPosition);

  final double currentPosition;

  @override
  List<Object> get props => [currentPosition];
}

class MainBottomSheetPageChange extends MainBottomSheetEvent {
  const MainBottomSheetPageChange(this.currentPage);

  final int currentPage;

  @override
  List<Object> get props => [];
}
