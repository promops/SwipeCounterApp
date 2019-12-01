import 'package:bloc/bloc.dart';
import 'package:swipe_counter/repository/counter_repository.dart';

import 'swipe_counter.dart';

class SwipeCounterBloc extends Bloc<SwipeCounterEvent, SwipeCounterState> {
  @override
  SwipeCounterState get initialState => InitialState();

  @override
  Stream<SwipeCounterState> mapEventToState(SwipeCounterEvent event) async* {
    if (event is Init) {
      yield LoadingState();

      await CounterRepository().init();
      yield CounterState(CounterRepository().count);
    }

    if (event is Increment) {
      CounterRepository().increment();
      yield CounterState(CounterRepository().count);
    }

    if (event is Decrement) {
      CounterRepository().decrement();
      yield CounterState(CounterRepository().count);
    }

    if (event is Reset) {
      CounterRepository().reset();
      yield CounterState(CounterRepository().count);
    }
  }
}
