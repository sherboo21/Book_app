import 'package:education/feature/home/data/model/books.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum RequestState { initial, loading, success, error }

extension RequestStateX on RequestState {
  bool get isInitial => this == RequestState.initial;

  bool get isLoading => this == RequestState.loading;

  bool get isSuccess => this == RequestState.success;

  bool get isError => this == RequestState.error;
}

@immutable
class HomeState extends Equatable {
  final RequestState booksState;
  final BooksDataModel? booksDataModel;
  final String? errorMessage;

  const HomeState({
    this.booksState = RequestState.initial,
    this.booksDataModel,
    this.errorMessage,
  });

  HomeState copyWith({
    RequestState? booksState,
    BooksDataModel? booksDataModel,
    String? errorMessage,
  }) {
    return HomeState(
      booksState: booksState ?? this.booksState,
      booksDataModel: booksDataModel ?? this.booksDataModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [booksState, booksDataModel, errorMessage];
}
