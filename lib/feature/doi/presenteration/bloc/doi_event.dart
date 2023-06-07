part of 'doi_bloc.dart';

@immutable
abstract class DoiEvent extends Equatable {}

class LoadDoiEvent extends DoiEvent {
  LoadDoiEvent();

  @override
  List<Object?> get props => [];
}
