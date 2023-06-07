part of 'doi_bloc.dart';

class DoiState {
  BaseStatus? doi;

  DoiState({
    this.doi,
  });

  DoiState copyWith({
    BaseStatus? doi,
  }) {
    return DoiState(
      doi: doi ?? this.doi,
    );
  }
}
