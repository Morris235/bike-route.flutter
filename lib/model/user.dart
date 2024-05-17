class User {
  final String id;
  final String name;
  final int birth;
  final double distanceDriven;
  final String? created;
  final String? deleted;

  User(
      {required this.id,
      required this.name,
      required this.birth,
      required this.distanceDriven,
      required this.created,
      required this.deleted});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        birth: json['birth'],
        distanceDriven: json['distance_driven'],
        created: json['created'],
        deleted: json['deleted']);
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
