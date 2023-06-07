part of 'provider_bloc.dart';

@immutable
abstract class ProviderEvent extends Equatable {}

class LoadProviderEvent extends ProviderEvent {
  final String consortiumId;

  LoadProviderEvent(this.consortiumId);

  @override
  List<Object?> get props => [consortiumId,];
}