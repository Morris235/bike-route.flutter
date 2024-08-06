// enum Fruits {
//   apple('red', 1000, true),
//   banana('yellow', 1500, false),
//   grape('purple', 2000, true),
//   ;

//   final String color;
//   final int price;
//   final bool favorite;
//   const Fruits(this.color, this.price, this.favorite);

//   // 특정 색깔인 과일 찾기
//   factory Fruits.getByColor(String fruitColor) {
//     return Fruits.values
//         .firstWhere((value) => value.color == fruitColor);
//   }
// }

/*
enum NewColor {
  red("레드", "red"),
  blue("블루", "blue"),
  white("화이트", "white"),
  amber("엠버","amber");
  
  final String korean;
  final String english;  
  const NewColor(this.korean, this.english);    
}
  print(NewColor.amber.korean);
  print(NewColor.amber.english);
  // 엠버
  // amber
*/

enum CourseField {
  id(field: "id"),
  name(field: "name"),
  rate(field: "rate"),
  finishTime(field: "finish_time"),
  ownerId(field: "owner_id"),
  created(field: "created"),
  deleted(field: "deleted");

  final String field;

  const CourseField({required this.field});
}

String findAllCourse({
  bool id = false,
  bool name = false,
  bool rate = false,
  bool finishTime = false,
  bool ownerId = false,
  bool created = false,
  bool deleted = false,
}) {
  return '''query {
  findAllCourse {
    ${id ? 'id' : ''},
    ${name ? 'name' : ''},
    ${rate ? 'rate' : ''},
    ${finishTime ? 'finish_time' : ''},
    ${ownerId ? 'owner_id' : ''},
    ${created ? 'created' : ''},
    ${deleted ? 'deleted' : ''},
  }
}''';
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
