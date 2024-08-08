import 'dart:io';

import 'package:bike_route/utils/logging.dart';
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
  final QueryOptions options = QueryOptions(
    document: gql(query),
    variables: variables,
  );
  try {
    final QueryResult<Object?> result = await clientFor().value.query(options);

    if (result.hasException) {
      logger.severe('GrapqhQL Exception :  ${result.exception.toString()}');
      return result;
    } else {
      return result;
    }

  } catch (e) {
    logger.severe(
        'Connection Exception :  ${e.toString()}', e, StackTrace.current);
    throw Exception('Failed to perform query');
  }
}

Future<dynamic> performMutation(String mutate,
    {required Map<String, dynamic> variables}) async {
  final MutationOptions options = MutationOptions(
    document: gql(mutate),
    variables: variables,
  );
  try {
    final QueryResult<Object?> result = await clientFor().value.mutate(options);
    if (result.hasException) {
      logger.severe('GrapqhQL Exception :  ${result.exception.toString()}');
      return result;
    } else {
      return result;
    }
  } catch (e) {
    logger.severe(
        'Connection Exception :  ${e.toString()}', e, StackTrace.current);
    throw Exception('Failed to perform query');
  }
}
