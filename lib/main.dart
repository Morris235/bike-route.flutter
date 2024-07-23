import 'dart:io';

import 'package:bike_route/bloc_counter/counter_b.dart';
import 'package:bike_route/bloc_counter/counter_bloc.dart';
import 'package:bike_route/cubit_counter/cubit/counter_cubit.dart';
import 'package:bike_route/home/home.dart';
import 'package:bike_route/login/login.dart';
import 'package:bike_route/observer.dart';
import 'package:bike_route/cubit_counter/counter_c.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();
  bool isIOS = Platform.isIOS;
  final HttpLink httpLink = HttpLink(
    isIOS ? 'http://127.0.0.1:8080/graphql' : 'http://10.0.2.2:8080/graphql',
  );

  ValueNotifier<GraphQLClient> initClient() {
    ValueNotifier<GraphQLClient> client =
        ValueNotifier(GraphQLClient(link: httpLink, cache: GraphQLCache()));
    return client;
  }

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observer();
  runApp(MyApp(client: initClient()));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;
  const MyApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: "bloc test"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: SizedBox(
        child: Column(
          children: [
            Flexible(
              child: BlocProvider(
                create: (_) => CounterCubit(),
                child: const CounterC(),
              ),
            ),
            Flexible(
              child: BlocProvider(
                create: (_) => CounterBloc(),
                child: const CounterB(),
              ),
            ),
            Flexible(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const Text('graphQL test page'),
              ),
            ),
            Flexible(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                child: const Text('login page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
