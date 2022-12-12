part of 'counter_cubit.dart';

abstract class CounterCubitState {
  int counter;
  CounterCubitState(this.counter);
}

class CubitInitialState extends CounterCubitState {
  CubitInitialState(super.counter);
}

class CubitChangtState extends CounterCubitState {
  CubitChangtState(super.counter);
}
