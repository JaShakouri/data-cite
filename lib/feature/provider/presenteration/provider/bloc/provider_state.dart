part of 'provider_bloc.dart';

class ProviderState {
  BaseStatus? provider;

  ProviderState({
    this.provider,
  });

  ProviderState copyWith({
    BaseStatus? provider,
  }) {
    return ProviderState(
      provider: provider ?? this.provider,
    );
  }
}
