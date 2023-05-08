
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final bool isIncremented ;
  final int counter;
  const CounterState({required this.counter, this.isIncremented = false});

  @override
  List<Object?> get props => [counter, isIncremented ];

}
