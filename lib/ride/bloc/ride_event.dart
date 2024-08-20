part of 'ride_bloc.dart';

abstract class RideEvent extends Equatable {
  const RideEvent();
}

class ClassNameSomeThingEvent extends RideEvent {
  const ClassNameSomeThingEvent(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}
