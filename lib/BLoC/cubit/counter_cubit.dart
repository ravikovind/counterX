import 'package:bloc/bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // final ConnectivityCubit connectivityCubit;

  // late StreamSubscription subscription;

  CounterCubit(
      // {required this.connectivityCubit}
      )
      : super(CounterState(valueX: 2)) {
    // counterConnectivityMonitor();
  }

  // void counterConnectivityMonitor() {
  //   // ignore: deprecated_member_use
  //   subscription = connectivityCubit.listen((state) {
  //     if (state is ConnectivityConnected &&
  //         state.connectionType == ConnectionType.Wifi) {
  //       doubleX();
  //     } else if (state is ConnectivityConnected &&
  //         state.connectionType == ConnectionType.Mobile) {
  //       triple();
  //     }
  //   });
  // }

  void doubleX() => emit(CounterState(valueX: 2 * state.valueX));
  void triple() => emit(CounterState(valueX: 3 * state.valueX));
  void half() => emit(CounterState(valueX: 0.5 * state.valueX));
  void one3rd() => emit(CounterState(valueX: 1 / 3 * state.valueX));

  // @override
  // Future<void> close() {
  //   subscription.cancel();
  //   return super.close();
  // }
}
