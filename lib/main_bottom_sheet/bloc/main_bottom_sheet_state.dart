part of 'main_bottom_sheet_bloc.dart';

class MainBottomSheetState extends Equatable {
  const MainBottomSheetState({
    this.value = '',
  });

  final String value;

  @override
  List<Object> get props => [value];

  MainBottomSheetState copyWith({
    String? value,
  }) {
    return MainBottomSheetState(
      value: value ?? this.value,
    );
  }
}
