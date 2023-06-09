import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/feature/client/data/models/response_clients_totals_model.dart';

abstract class ClientRepository {
  Future<DataState<ClientsTotal>> loadClient(
    String providerId,
  );
}
