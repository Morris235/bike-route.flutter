import 'package:bike_route/home/home.dart';
import 'package:bike_route/queries/route_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RouteListTest extends StatelessWidget {
  const RouteListTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
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
                  subtitle: Row(
                    children: [
                      Text(route['name']),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(route['owner_id']),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
