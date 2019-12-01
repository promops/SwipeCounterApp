import 'package:equatable/equatable.dart';

abstract class SwipeCounterEvent extends Equatable {}

class Increment extends SwipeCounterEvent {
  @override
  List<Object> get props => null;
}

class Decrement extends SwipeCounterEvent {
  @override
  List<Object> get props => null;
}

class Init extends SwipeCounterEvent {
  @override
  List<Object> get props => null;
}

class Reset extends SwipeCounterEvent {
  @override
  List<Object> get props => null;
}
