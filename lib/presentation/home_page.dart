import 'package:bike_route/presentation/counter_page.dart';
import 'package:bike_route/query/route_query.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
            child: buildRouteList(),
          ),
          Mutation(
            options: MutationOptions(document: gql(createRoute)),
            builder: (RunMutation runMutation, QueryResult? result) {
              return ElevatedButton(
                onPressed: () {
                  runMutation({
                    'id': '2r',
                    'name': 'down hill',
                    'rate': 15,
                    'owner_id': 'jack'
                  });
                },
                child: const Text('Add Route'),
              );
            },
          ),
          Mutation(
            options: MutationOptions(document: gql(updateRoute)),
            builder: (RunMutation runMutation, QueryResult? result) {
              return ElevatedButton(
                onPressed: () {
                  runMutation({
                    'id': '1r',
                    'name': 'down hill',
                    'rate': 7,
                    'owner_id': 'jim'
                  });
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
          ),
        ],
      ),
    );
  }

  Widget buildRouteList() {
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
        final routes = result.data?['routes'];
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
