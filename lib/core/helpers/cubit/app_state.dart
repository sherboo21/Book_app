import 'app_cubit.dart';

class AppState {
  final bool homeUserDropDown;

  AppState({
    required this.homeUserDropDown,
  });

  // Updated copyWith to take a Map of field names and values
  AppState copyWith(Map<String, dynamic> updates) {
    return AppState(
      homeUserDropDown: updates[AppStateField.homeUserDropDown.toString()] ??
          homeUserDropDown,
    );
  }
}
