import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/counter_bloc.dart';

import 'bloc_exem_page_two.dart';

class BlocExemplPage extends StatefulWidget {
  const BlocExemplPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BlocExemplPageState createState() => _BlocExemplPageState();
}

class _BlocExemplPageState extends State<BlocExemplPage> {
  @override
  Widget build(BuildContext maincontext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return const Text(
                    'You have pushed the button this many times:',
                  );
                }
                if (state is CounterChanget) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: context.read<CounterBloc>(),
                            child: const BlocExemPageTwo(),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      state.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  );
                }
                return Text("Click button");
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    maincontext.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: const Icon(Icons.add),
                ),
                TextButton(
                  onPressed: () {
                    maincontext.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
