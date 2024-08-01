const String findAllCourse = r'''query {
  findAllCourse {
    id,
    name,
    rate,
    finish_time,
    owner_id,
    created,
    deleted
  }
}''';

const String createCourse =
    r'''mutation($id: ID!, $name: String!, $rate: Int, $owner_id: String) {
  createCourse(id: $id, name: $name, rate: $rate, owner_id: $owner_id) {
    id,
    name,
    rate,
    owner_id
  }
}''';

const String updateCourse =
    r'''mutation($id: ID!, $name: String!, $rate: Int, $owner_id: String) {
  updateCourse(id: $id, name: $name, rate: $rate, owner_id: $owner_id){
      id,
      name,
      finish_time,
      rate,
      owner_id
  }
}''';

const String deleteCourseById = r'''mutation($id: ID!) {
  deleteCourseById(id: $id)
}''';
