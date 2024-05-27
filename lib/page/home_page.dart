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
      body: Query(
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
      ),
    );

    Mutation(
      options: MutationOptions(document: gql(addUser)),
      builder: (RunMutation runMutation, QueryResult? result) {
        return ElevatedButton(
          onPressed: () {
            runMutation({'id': '2', 'name': 'John Doe'});
          },
          child: Text('Add User'),
        );
      },
    );
  }
}
