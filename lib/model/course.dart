class Course {
  final String id;
  final String name;
  final int rate;
  final String finishTime;
  final String ownerId;
  final String? created;
  final bool? deleted;

  Course(
      {required this.id,
      required this.name,
      required this.rate,
      required this.finishTime,
      required this.ownerId,
      required this.created,
      required this.deleted});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        id: json['id'],
        name: json['name'],
        rate: json['rate'],
        finishTime: json['finish_time'],
        ownerId: json['owner_id'],
        created: json['created'],
        deleted: json['deleted']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rate': rate,
        'finish_time': finishTime,
        'owner_id': ownerId,
        'created': created,
        'deleted': deleted,
      };
}
