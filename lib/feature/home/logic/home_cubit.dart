import 'dart:developer';

import 'package:education/feature/home/data/model/books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(const HomeState()) {
    onInit();
  }

  Future<void> onInit() async {
    try {
      await Future.wait<void>([
        getBooks(),
      ]);
    } catch (e) {
      log('Error fetching data $e', name: 'Error message');
    }
  }

  var booksDataModel = getIt<BooksDataModel>();

  /// get books ///
  getBooks() => _onGetBooks();

  void _onGetBooks() async {
    emit(state.copyWith(booksState: RequestState.loading));
    final result = await _homeRepository.getBooks();
    result.when(
      success: (response) {
        emit(state.copyWith(
            booksState: RequestState.success, booksDataModel: response));
        booksDataModel = response;
      },
      failure: (String errorMessage) => emit(state.copyWith(
          booksState: RequestState.error, errorMessage: errorMessage)),
    );
  }
}
