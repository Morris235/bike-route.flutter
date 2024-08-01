import 'dart:io';

import 'package:bike_route/utils/logging.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final String uri = Platform.isIOS
    ? 'http://127.0.0.1:8080/graphql'
    : 'http://10.0.2.2:8080/graphql';

final HttpLink httpLink = HttpLink(uri);
// final Logger _logger = Logger('GraphQLLogger');

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

// FIXME: 필요한 필드 데이터만 쿼리할 수 있도록 수정
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
