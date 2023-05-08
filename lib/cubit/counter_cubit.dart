import 'package:bloc/bloc.dart';

import 'counter_state.dart';


class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 0));
  void increment () => emit( CounterState(counter: state.counter + 1, isIncremented: true));
  void decrement () => emit(CounterState(counter: state.counter - 1));
}
