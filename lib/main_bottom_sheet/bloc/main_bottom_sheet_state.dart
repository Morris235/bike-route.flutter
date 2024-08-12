part of 'main_bottom_sheet_bloc.dart';

class MainBottomSheetState extends Equatable {
  const MainBottomSheetState({this.endPosition = 0.0, this.size = 193.0});

  final double endPosition;
  final double size;

  double get gestureAbleSize => size >= 800 ? 50 : 193;

  @override
  List<Object> get props => [endPosition, size, gestureAbleSize];

  MainBottomSheetState copyWith({
    double? position,
    double? endPosition,
    bool? isDragEnd,
    double? size,
  }) {
    return MainBottomSheetState(
      endPosition: position ?? this.endPosition,
      size: size ?? this.size,
    );
  }
}
