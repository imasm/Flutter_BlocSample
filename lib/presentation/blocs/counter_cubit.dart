import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  void increment(int incrementValue) {
    // Emit a new state with the updated counter value
    emit(
      state.copyWith(
        counter: state.counter + incrementValue,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }

  void reset() {
    // Emit a new state with the counter reset to 0
    emit(state.copyWith(counter: 0));
  }
}

class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});

  CounterState copyWith({int? counter, int? transactionCount}) {
    return CounterState(
      counter: counter ?? this.counter,
      transactionCount: transactionCount ?? this.transactionCount,
    );
  }

  @override
  List<Object> get props => [counter, transactionCount];
}
