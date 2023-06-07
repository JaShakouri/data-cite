import 'dart:convert';

import 'package:de_dtcite/config/api/api_const.dart';
import 'package:de_dtcite/config/api/dio_client.dart';
import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/feature/client/data/models/response_client_model.dart';
import 'package:de_dtcite/feature/client/data/repository/client_repository.dart';

class ClientRepositoryImpl extends ClientRepository {
  final DioClient dioClient;

  ClientRepositoryImpl(this.dioClient);

  @override
  Future<DataState<ResponseClientModel>> loadClient(
      String providerId, int pageSize, int pageIndex) async {
    try {
      var result = await dioClient.get(
        getClients,
        queryParameters: {
          "provider-id": providerId,
          "page[number]": pageIndex,
          "page[size]": pageSize,
        },
      );

      if (result != null && result.statusCode == 200) {
        var mapper = responseClientModelFromJson(jsonEncode(result.data));
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
