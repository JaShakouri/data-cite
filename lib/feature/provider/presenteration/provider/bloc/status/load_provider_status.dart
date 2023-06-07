import 'package:de_dtcite/feature/provider/data/models/response_provider_model.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/bloc/status/provider_status.dart';

class ProviderLoadedState extends ProviderStatus {
  final List<ProviderData> list;

  ProviderLoadedState(this.list);

  @override
  List<Object?> get props => [
        list,
      ];
}
