import 'package:de_dtcite/config/api/api_const.dart';
import 'package:de_dtcite/config/api/dio_client.dart';
import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/feature/client/data/models/response_clients_totals_model.dart';
import 'package:de_dtcite/feature/client/data/repository/client_repository.dart';

class ClientRepositoryImpl extends ClientRepository {
  final DioClient dioClient;

  ClientRepositoryImpl(this.dioClient);

  @override
  Future<DataState<ClientsTotal>> loadClient(String providerId) async {
    try {
      var result = await dioClient.get(
        getClientsTotal,
        queryParameters: {
          "provider-id": providerId,
        },
      );

      if (result != null && result.statusCode == 200) {
        var mapper = ClientsTotal.fromJson(result.data);
        return DataSuccess(
          mapper,
        );
      }

      return DataFailed(
        "Error connection",
      );
    } catch (ex) {
      return DataFailed(ex.toString());
    }
  }
}
