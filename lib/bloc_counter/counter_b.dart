import 'package:bike_route/bloc_counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterB extends StatelessWidget {
  const CounterB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BloC Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text('$count',
                style: Theme.of(context).textTheme.headlineMedium),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "bloc increment button",
            child: const Icon(Icons.add),
            onPressed: () =>
                context.read<CounterBloc>().add(CounterIncrementPressed()),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            heroTag: "bloc decrement button",
            child: const Icon(Icons.remove),
            onPressed: () =>
                context.read<CounterBloc>().add(CounteDecrementPressed()),
          ),
        ],
      ),
    );
  }
}
