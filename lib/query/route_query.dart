const String findAllRoute = r'''query {
  findAllRoutes{
    id,
    name,
    finish_time,
    rate,
    owner_id
  }
}''';

const String createRoute = r'''mutation($id: ID!, $name: String!, $rate: Int, $owner_id: String) {
  createRoute(id: $id, name: $name, rate: $rate, owner_id: $owner_id) {
    id,
    name,
    rate,
    owner_id
  }
}''';

const String updateRoute = r'''mutation($id: ID!, $name: String!, $rate: Int, $owner_id: String) {
  updateRoute(id: $id, name: $name, rate: $rate, owner_id: $owner_id){
      id,
      name,
      finish_time,
      rate,
      owner_id
  }
}''';

const String deleteRouteById = r'''mutation($id: ID!) {
  deleteRouteById(id: $id)
}''';