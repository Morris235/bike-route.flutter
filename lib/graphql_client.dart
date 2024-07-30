import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient>? clientFor({required String uri}) {
  final HttpLink httpLink = HttpLink(uri);
  final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
          link: httpLink, cache: GraphQLCache(store: InMemoryStore())));
  return client;
}
