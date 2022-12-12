part of 'counter_bloc.dart';

abstract class CounterState {
  int counter;
  CounterState(this.counter);
}

class CounterInitial extends CounterState {
  CounterInitial(super.counter);
}

class CounterChanget extends CounterState {
  CounterChanget(super.counter);
}
