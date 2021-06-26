import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter/BLoC/cubit/connectivity_cubit.dart';
import 'package:counter/BLoC/cubit/counter_cubit.dart';
import 'package:counter/UI/RouteHelper/RouteHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    routeHelper: RouteHelper(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final RouteHelper routeHelper;
  final Connectivity connectivity;

  const MyApp({required this.connectivity, required this.routeHelper});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>(
            create: (context) => ConnectivityCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'bloc',
        onGenerateRoute: routeHelper.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
      ),
    );
  }
}
