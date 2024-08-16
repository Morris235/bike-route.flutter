part of 'main_bottom_sheet_bloc.dart';

class MainBottomSheetState extends Equatable {
  const MainBottomSheetState({this.endPosition = 0.0, this.size = 193.0});

  final double endPosition;
  final double size;

  double get gestureAbleSize => size >= 800.0 ? 50.0 : 150.0;
  bool get isExpanded => size >= 800.0;

  @override
  List<Object> get props => [endPosition, size, gestureAbleSize];

  MainBottomSheetState copyWith({
    double? endPosition,
    double? size,
  }) {
    return MainBottomSheetState(
      endPosition: endPosition ?? this.endPosition,
      size: size ?? this.size,
    );
  }
}
