const String getUser = r'''
  query GetUser {
    user {
      id
      name
    }
  }
''';

const String addUser = r'''
  mutation AddBook($title: String!, $author: String!) {
    addUser(id: $id, name: $name) {
      id
      name
    }
  }
''';
