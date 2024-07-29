part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.id = '',
    this.name = '',
    this.rate = 0,
    this.finishTime = '',
    this.ownerId = '',
    this.created = '',
    this.deleted = false,
  });

  final String id;
  final String name;
  final int rate;
  final String finishTime;
  final String ownerId;
  final String created;
  final bool deleted;

  @override
  List<Object> get props =>
      [id, name, rate, finishTime, ownerId, created, deleted];

  HomeState copyWith({
    String? id,
    String? name,
    int? rate,
    String? finishTime,
    String? ownerId,
    String? created,
    bool? deleted,
  }) {
    return HomeState(
      id: id ?? this.id,
    );
  }
}
