part of 'connectivity_cubit.dart';

abstract class ConnectivityState {
  const ConnectivityState();
}

class ConnectivityLoading extends ConnectivityState {}

class ConnectivityConnected extends ConnectivityState {
  late final ConnectionType connectionType;
  ConnectivityConnected({required this.connectionType});
}

class ConnectivityDisconnected extends ConnectivityState {}
