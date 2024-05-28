import 'package:bike_route/queries/route_query.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:bike_route/queries/user_query.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GraphQL Test')),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 400,
            child: buildQueryList(),
          ),
          Mutation(
            options: MutationOptions(document: gql(createRoute)),
            builder: (RunMutation runMutation, QueryResult? result) {
              return ElevatedButton(
                onPressed: () {
                  runMutation({'id': '2r', 'name': 'down hill', 'rate': 3, 'owner_id': 'morris'});
                },
                child: const Text('Add Route'),
              );
            },
          ),
          Mutation(
            options: MutationOptions(document: gql(updateRouteById)),
            builder: (RunMutation runMutation, QueryResult? result) {
              return ElevatedButton(
                onPressed: () {
                  runMutation({'id': '2r', 'name': 'up hill', 'rate': 7, 'owner_id': 'jim'});
                },
                child: const Text('update Route'),
              );
            },
          ),
          Mutation(
            options: MutationOptions(document: gql(deleteRouteById)),
            builder: (RunMutation runMutation, QueryResult? result) {
              return ElevatedButton(
                onPressed: () {
                  runMutation({'id': '2r'});
                },
                child: const Text('delete Route'),
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildQueryList() {
    return Query(
      options: QueryOptions(document: gql(findAllRoute)),
      builder: (QueryResult? result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result!.hasException) {
          return Text(result.exception.toString());
        }
        if (result.isLoading) {
          return const CircularProgressIndicator();
        }
        final routes = result.data?['findAllRoutes'];
        return ListView.builder(
          itemCount: routes?.length ?? 0,
          itemBuilder: (context, index) {
            final route = routes![index];
            return ListTile(
              title: Text(route['id']),
              subtitle: Text(route['name']),
            );
          },
        );
      },
    );
  }
}
