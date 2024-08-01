class Course {
  final String? id;
  final String? name;
  final int? rate;
  final String? finishTime;
  final String? ownerId;
  final String? created;
  final bool? deleted;

  Course(
      {required this.id,
      required this.name,
      required this.rate,
      required this.finishTime,
      required this.ownerId,
      this.created,
      this.deleted});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String?,
      name: json['name'] as String?,
      rate: json['rate'] as int?,
      finishTime: json['finish_time'] as String?,
      ownerId: json['owner_id'] as String?,
      created: json['created'] as String?,
      deleted: json['deleted'] as bool?,
    );
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
