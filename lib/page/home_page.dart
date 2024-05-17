import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:bike_route/queries/user_query.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GraphQL Flutter')),
      body: Query(
        options: QueryOptions(document: gql(getUser)),
        builder: (QueryResult? result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result!.hasException) {
            return Text(result.exception.toString());
          }
          if (result.isLoading) {
            return const CircularProgressIndicator();
          }
          final user = result.data?['books'];
          return ListView.builder(
            itemCount: user?.length ?? 0,
            itemBuilder: (context, index) {
              final book = user![index];
              return ListTile(
                title: Text(book['id']),
                subtitle: Text(book['name']),
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
