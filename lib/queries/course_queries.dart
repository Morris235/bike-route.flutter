String findAllCourse({
  bool id = false,
  bool name = false,
  bool rate = false,
  bool finishTime = false,
  bool ownerId = false,
  bool created = false,
  bool deleted = false,
}) {
  final fields = [
    if (id) 'id',
    if (name) 'name',
    if (rate) 'rate',
    if (finishTime) 'finish_time',
    if (ownerId) 'owner_id',
    if (created) 'created',
    if (deleted) 'deleted',
  ].join(', ');

  return '''query {
      findAllCourse {
        $fields
      }
    }
  ''';
}

const String createCourse =
    r'''mutation($id: String!, $name: String!, $rate: Int, $owner_id: String) {
  createCourse(id: $id, name: $name, rate: $rate, owner_id: $owner_id) {
    id,
    name,
    rate,
    owner_id
  }
}''';

const String updateCourse =
    r'''mutation($id: String!, $name: String!, $rate: Int, $owner_id: String) {
  updateCourse(id: $id, name: $name, rate: $rate, owner_id: $owner_id){
      id,
      name,
      finish_time,
      rate,
      owner_id
  }
}''';

const String deleteCourseById = r'''mutation($id: String!) {
  deleteCourseById(id: $id)
}''';
