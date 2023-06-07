import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/feature/client/data/models/response_client_model.dart';

abstract class ClientRepository {
  Future<DataState<ResponseClientModel>> loadClient(
      String providerId,
      int pageSize,
      int pageIndex,
      );
}
