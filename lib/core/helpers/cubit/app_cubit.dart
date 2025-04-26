import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state.dart';

enum AppStateField {
  homeUserDropDown,
}

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(AppState(
          homeUserDropDown: false,
        ));

  void updateState<T>(AppStateField field, T value) {
    final updatedState = state.copyWith({field.toString(): value});
    emit(updatedState);
  }
}
