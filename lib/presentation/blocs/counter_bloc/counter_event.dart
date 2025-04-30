part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncreasedEvent extends CounterEvent {
  final int value;
  const CounterIncreasedEvent(this.value);
}

class CounterResetEvent extends CounterEvent {
  const CounterResetEvent();
}
