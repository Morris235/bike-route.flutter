import 'package:bike_route/home/home.dart';
import 'package:bike_route/queries/route_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('GraphQL Test')),
        body: Column(
          children: [
            const SizedBox(
              width: 300,
              height: 400,
              child: RouteListTest(),
            ),
            Mutation(
              options: MutationOptions(document: gql(createRoute)),
              builder: (RunMutation runMutation, QueryResult? result) {
                return ElevatedButton(
                  onPressed: () {
                    runMutation(
                      {
                        'id': '4r',
                        'name': 'up down hill',
                        'rate': 10,
                        'owner_id': 'dorris',
                      },
                    );
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
                    runMutation(
                      {
                        'id': '1r',
                        'name': 'down hill',
                        'rate': 7,
                        'owner_id': 'jim'
                      },
                    );
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
      ),
    );
  }
}
