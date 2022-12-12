import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/counter_bloc.dart';

class BlocExemPageTwo extends StatefulWidget {
  const BlocExemPageTwo({Key? key}) : super(key: key);

  @override
  _BlocExemPageTwoState createState() => _BlocExemPageTwoState();
}

class _BlocExemPageTwoState extends State<BlocExemPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Example TWO"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.read<CounterBloc>().state.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            BlocBuilder<CounterBloc, CounterState>(
              bloc: context.read<CounterBloc>(),
              builder: (context, state) {
                if (state is CounterInitial) {
                  return const Text(
                    'You have pushed the button this many times:',
                  );
                }
                if (state is CounterChanget) {
                  return Text(
                    state.counter.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Text("Click button");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent());
            },
            tooltip: 'decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
