part of 'main_bottom_sheet_bloc.dart';

abstract class MainBottomSheetEvent extends Equatable {
  const MainBottomSheetEvent();
}

class BottomSheetSomeThingEvent extends MainBottomSheetEvent {
  const BottomSheetSomeThingEvent(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}