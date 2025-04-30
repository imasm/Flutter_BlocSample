import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncreasedEvent>(_onCounterIncreased);
    on<CounterResetEvent>(_onCounterReset);
  }

  // Increase Event
  void _onCounterIncreased(CounterIncreasedEvent event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }

  // Reset Event
  void _onCounterReset(CounterResetEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0));
  }

  increment(int value) {
    add(CounterIncreasedEvent(value));
  }

  reset() {
    add(const CounterResetEvent());
  }
}
