
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_state_pattern/cubit/counter_cubit.dart';
import 'package:flutter_bloc_state_pattern/cubit/counter_state.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){
  group('Counter Cubit', (){
    CounterCubit cubit = CounterCubit();
    setUp(() {
      cubit = CounterCubit();
    });
    tearDown(() {
      cubit.close();
      if(kDebugMode){
        print('cancel called');
      }
    });
    test('the initial state for the counter cubit is CounterState(counterValue:0)', (){
      expect(cubit.state, const CounterState(counter: 0,));
    });
    blocTest('test of increment function', build: () => cubit,
    act: (bloc) => bloc.increment(),
      expect: () => [const CounterState(counter: 1, isIncremented: true)] ,
    );
    blocTest('test of decrement function', build: () => cubit,
      act: (bloc) => bloc.decrement(),
      expect: () => [const CounterState(counter: -1, isIncremented: false)]
    );
  });
}