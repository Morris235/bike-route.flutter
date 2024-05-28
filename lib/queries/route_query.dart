const String findAllRoute = r'''query {
  findAllRoutes{
    id,
    name,
    finish_time,
    rate,
    owner_id
  }
}''';

const String createRoute = r'''mutation {
  createRoute(id: "2r", name: "down hill", rate: 3, owner_id: "morris") {
    id,
    name,
    rate,
    owner_id
  }
}''';

const String updateRouteById = r'''mutation {
  updateRouteById(id: "2r", name: "up hill", rate: 4, owner_id: "jim"){
    id,
    name,
    rate,
    owner_id
  }
}''';

const String deleteRouteById = r'''mutation {
  deleteRouteById(id: "2r")
}''';