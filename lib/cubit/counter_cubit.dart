import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CubitInitialState(0));

  void inkrement() {
    state.counter++;
    emit(CubitChangtState(state.counter));
  }

  void decrement() {
    state.counter--;
    emit(CubitChangtState(state.counter));
  }
}
