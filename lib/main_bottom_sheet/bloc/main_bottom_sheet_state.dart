part of 'main_bottom_sheet_bloc.dart';

class MainBottomSheetState extends Equatable {
  const MainBottomSheetState({
    this.startPosition = 0.0,
    this.endPosition = 0.0,
    this.size = 193.0,
    this.dragCancel = false,
  });

  final double startPosition;
  final double endPosition;
  final double size;
  final bool dragCancel;

  @override
  List<Object> get props => [size, endPosition, dragCancel];

  MainBottomSheetState copyWith({
    double? endPosition,
    double? size,
    bool? dragCancel,
  }) {
    return MainBottomSheetState(
      endPosition: endPosition ?? this.endPosition,
      size: size ?? this.size,
      dragCancel: dragCancel ?? this.dragCancel,
    );
  }
}
