part of 'main_bottom_sheet_bloc.dart';

abstract class MainBottomSheetEvent extends Equatable {
  const MainBottomSheetEvent();
}

class MainBottomSheetSizeChange extends MainBottomSheetEvent {
  const MainBottomSheetSizeChange(this.size);

  final double size;

  @override
  List<Object> get props => [size];
}

class MainBottomSheetDragCancel extends MainBottomSheetEvent {
  const MainBottomSheetDragCancel(this.dragCancel);

  final bool dragCancel;

  @override
  List<Object> get props => [dragCancel];
  
}