part of 'client_bloc.dart';

class ClientState {
  BaseStatus? client;

  ClientState({
    this.client,
  });

  ClientState copyWith({
    BaseStatus? client,
  }) {
    return ClientState(
      client: client ?? this.client,
    );
  }
}
