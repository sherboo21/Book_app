import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  StreamSubscription? _subscription;

  InternetConnectionCubit() : super(InternetConnectionInitial()) {
    _monitorConnectivity();
  }

  void _monitorConnectivity() {
    Connectivity().checkConnectivity().then((result) {
      _updateState(result);
    });
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      _updateState(result);
    });
  }

  void _updateState(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      emit(InternetConnectedState('Internet Connected'));
    } else {
      emit(InternetNotConnectedState('Internet Not Connected'));
    }
  }

  void retryConnection() async {
    final result = await Connectivity().checkConnectivity();
    _updateState(result);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
