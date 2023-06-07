part of 'client_bloc.dart';

@immutable
abstract class ClientEvent extends Equatable {}

class LoadClientEvent extends ClientEvent {
  LoadClientEvent();

  @override
  List<Object?> get props => [];
}
