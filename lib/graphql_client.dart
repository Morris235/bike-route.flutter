import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient>? initClient({required String uri}) {
    // JWT 인증 적용시 사용
  // final AuthLink authLink =
  //     AuthLink(getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>');
  // final Link link = authLink.concat(httpLink);
  
  final HttpLink httpLink = HttpLink(uri);
  final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );
  return client;
}
