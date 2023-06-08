import 'package:de_dtcite/feature/client/data/models/response_clients_totals_model.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/bloc/status/provider_status.dart';

class ClientLoadedState extends ProviderStatus {
  final List<ClientsTotals> list;

  ClientLoadedState(this.list);

  @override
  List<Object?> get props => [
        list,
      ];
}
