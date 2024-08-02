String getUser({
  bool id = false,
  bool name = false,
  bool birth = false,
  bool distanceDriven = false,
  bool created = false,
  bool deleted = false,
}) {
  return '''
  query GetUser {
    user {
      ${id ? 'id' : ''},
      ${name ? 'name' : ''},
      ${birth ? 'birth' : ''},
      ${distanceDriven ? 'distance_driven' : ''},
      ${created ? 'created' : ''},
      ${deleted ? 'deleted' : ''},
    }
  }
''';
}

const String addUser = r'''
  mutation AddBook($title: String!, $author: String!) {
    addUser(id: $id, name: $name) {
      id
      name
    }
  }
''';
