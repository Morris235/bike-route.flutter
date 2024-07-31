import 'package:bike_route/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteListTest extends StatelessWidget {
  const RouteListTest({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(const HoemFetchRoutes());
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.builder(
              itemCount: state.courses.length,
              itemBuilder: (context, index) {
                final course = state.courses[index];
                return ListTile(
                  title: Text(course.id),
                  subtitle: Row(
                    children: [
                      Text(course.name),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(course.ownerId),
                    ],
                  ),
                );
              },
            );
      },
    );
  }
}
