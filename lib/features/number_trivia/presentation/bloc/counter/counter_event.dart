part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  List<Object> get props => [];
}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class ResetEvent extends CounterEvent {}
