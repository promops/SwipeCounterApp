import 'package:equatable/equatable.dart';

class SwipeCounterState extends Equatable {
  const SwipeCounterState();

  @override
  List<Object> get props => [];
}

class InitialState extends SwipeCounterState {}

class CounterState extends SwipeCounterState {
  final int count;

  CounterState(this.count);

  @override
  List<Object> get props => [count];
}

class LoadingState extends SwipeCounterState {}

class OutOfRangeState extends SwipeCounterState {
  @override
  List<Object> get props => [];
}
