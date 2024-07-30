import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final String uri = Platform.isIOS
    ? 'http://127.0.0.1:8080/graphql'
    : 'http://10.0.2.2:8080/graphql';

final HttpLink httpLink = HttpLink(uri);

ValueNotifier<GraphQLClient> clientFor() {
  final HttpLink httpLink = HttpLink(uri);
  final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    ),
  );
  return client;
}

Future<QueryResult> performQuery(String query,
    {required Map<String, dynamic> variables}) async {
  final QueryOptions options =
      QueryOptions(document: gql(query), variables: variables);
  final QueryResult<Object?> result =
      await clientFor().value.query(options);
  return result;
}
