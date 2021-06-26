import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter/Constants/Enums.dart';
part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity connectivity;

  ConnectivityCubit({required this.connectivity})
      : super(ConnectivityLoading()) {
    connectivityMonitor();
  }

  void connectivityMonitor() {
      connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi) {
        emitConnectivityConnected(ConnectionType.Wifi);
      } else if (result == ConnectivityResult.mobile) {
        emitConnectivityConnected(ConnectionType.Mobile);
      } else if (result == ConnectivityResult.none) {
        emitConnectivityDisconnected();
      }
    });
  }

  void emitConnectivityConnected(ConnectionType _tpye) =>
      emit(ConnectivityConnected(connectionType: _tpye));

  void emitConnectivityDisconnected() => emit(ConnectivityDisconnected());
}
