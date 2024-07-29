import 'package:bike_route/home/home.dart';
import 'package:bike_route/queries/route_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeRouteCudButton extends StatelessWidget {
  const HomeRouteCudButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Column(
        children: [
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
                      'owner_id': 'chris',
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
    );
  }
}
