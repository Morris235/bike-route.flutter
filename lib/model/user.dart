class User {
  final String? id;
  final String? name;
  final int? birth;
  final double? distanceDriven;
  final String? created;
  final bool? deleted;

  User(
      {this.id,
      this.name,
      this.birth,
      this.distanceDriven,
      this.created,
      this.deleted});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] as String?,
        name: json['name'] as String?,
        birth: json['birth'] as int?,
        distanceDriven: json['distance_driven'] as double?,
        created: json['created'] as String?,
        deleted: json['deleted'] as bool?);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'birth': birth,
        'distance_driven': distanceDriven,
        'created': created,
        'deleted': deleted,
      };
}
