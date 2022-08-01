part of 'counter_bloc.dart';

class CounterState {
  final int counter;

  const CounterState({required this.counter});

  List<Object> get props => [counter];
}

