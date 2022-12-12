import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/counter_bloc.dart';
import 'package:flutter_bloc_1/cubit/counter_cubit.dart';
import 'package:flutter_bloc_1/pages/bloc_exempl_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CounterCubit(),
            ),
            BlocProvider(
              create: (context) => CounterBloc(),
            )
          ],
          child: BlocExemplPage(),
        ));
  }
}
